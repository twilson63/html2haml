require "haml"
require "haml/html"
require "json"

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

get "/" do
  haml :index
end


post "/*" do
  puts params
  if params["page"]
    @html = params["page"]["html"]
    @haml = convert(@html)
    if params[:splat].include?("json")
      {:page => {:html => @html, :haml => @haml}}.to_json
    elsif params[:splat].include?("xml")
      to_xml
    else
      haml :index
    end
  end
end

def convert(html)
  Haml::HTML.new(@html, :erb => true, :xhtml => true).render
end

def to_xml
  builder do |xml|
    xml.instruct!
    xml.page do
      xml.html do
        xml.cdata! @html
      end
      xml.haml do
        xml.cdata! @haml
      end
    end
  end  
end


