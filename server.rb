require "sinatra"
require "html2haml"
require "haml"
require "json"
require "net/http"
require "open-uri"
require "crack"

Encoding.default_internal = Encoding.default_external = "UTF-8"

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

get "/*" do
  haml :index
end

post '/url' do
  begin
    @html = open("http://#{params[:q]}") { |f| f.read }
    @haml = convert(@html)
    haml :index
  rescue
    redirect '/'
  end
end

post '/api.json' do
  begin
    res = Crack::JSON.parse(request.body.read.to_s)
    @html = res["page"]["html"]
    @haml = convert(@html)
    { :page => {:html => @html, :haml => @haml}}.to_json
  rescue
    { :status => :error, :message => 'unable to parse json'}.to_json
  end
end


post "/*" do
  @html = params["page"]["html"]
  @haml = convert(@html)
  haml :index
end

def convert(html)
  Html2haml::HTML.new(html, :erb => true, :xhtml => false, 
    :ruby19_style_attributes => true).render
end
