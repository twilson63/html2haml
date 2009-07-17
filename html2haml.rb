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
  #%x("html2haml #{params[:html]}")
  #input = params[:html]
  puts params
  #puts convert(params[:page][:html])
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
  Haml::HTML.new(@html).render
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


template :index do
  <<-HTML  
%html
  %head
    %title HTML2Haml | Convert HTML Snippets to Haml
  %body{:style => "margin: 20px 100px;color:gray;font-family: Arial"}
    %h6{:style => "float:right;"}
      Haml
      %a{:href => "http://haml.hamptoncatlin.com/"} Home Page
    %h1{:style => "margin-bottom:5px;"} Html2Haml
    %p{:style => "margin:0px;"} Convert Html Snippets to Haml Snippets
    %hr
    %form{:method => "POST", :action => "/", :id => "page"}
      %label{:for => "page_html", :style => "display:block;"} Html (paste your html code and press convert)
      %textarea{:id => "page_html", :name => "page[html]", :style => "width:800px;height:250px;"}=h @html || ""
      %br
      %input{:type => "submit", :name => "commit", :value => "Convert", :style => "margin:20px;text-aligin:center;"}
      %br
      %label{:for => "page_html", :style => "display:block;"} Haml (Here is your html code in haml.)      
      %textarea{:id => "page_haml", :name => "page[haml]", :style => "width:800px;height:250px;"}= @haml || ""
    %hr
    %p
      This simple site created by Jack Russell Software...
      %a{:href => "http://blog.jackhq.com"} http://blog.jackhq.com
    %p
      Source at
      %a{:href => "http://github.com/twilson63/html2haml"} http://github.com/twilson63/html2haml
    %script{ :type => "text/javascript" }
      var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
      document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
    %script{ :type => "text/javascript" }
      try {
      var pageTracker = _gat._getTracker("UA-9459466-1");
      pageTracker._trackPageview();
      } catch(err) {}
  HTML
end

