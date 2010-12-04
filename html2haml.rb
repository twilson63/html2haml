require "sinatra"
require "haml"
require "haml/html"
require "json"
require "net/http"
require "open-uri"
require "crack"

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

get "/*" do
  haml :index
end

post '/url' do
  @html = open("http://#{params[:q]}") { |f| f.read }
  @haml = convert(@html)
  haml :index

end

post '/api.json' do
  puts request.body.to_s
  @res = Crack::JSON.parse(request.body)
  @html = @res[:page][:html]
  @haml = convert(@html)
  { :page => {:html => @html, :haml => @haml}}.to_json
end


post "/*" do
  @html = params["page"]["html"]
  @haml = convert(@html)
  haml :index
end

def convert(html)
  Haml::HTML.new(html, :erb => true, :xhtml => true).render
end


