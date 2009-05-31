require "haml"
require "haml/html"
require "json"

get "/" do
  haml :index
end

post "/json" do
  
end

post "/xml" do
    
end


post "/" do
  #%x("html2haml #{params[:html]}")
  #input = params[:html]
  @html = params["page"]["html"]
  @haml = convert(@html)
  puts @haml
  haml :index
  #params.inspect
end

def convert(html)
  Haml::HTML.new(@html).render
end


template :index do
  <<-HTML  
%html
  %body{:style => "margin: 20px 100px;color:gray;font-family: Arial"}
    %h6{:style => "float:right;"}
      Haml
      %a{:href => "http://haml.hamptoncatlin.com/"} Home Page
    %h1{:style => "margin-bottom:5px;"} Html2Haml
    %p{:style => "margin:0px;"} Convert Html Snippets to Haml Snippets
    %hr
    %form{:method => "POST", :action => "/", :id => "page"}
      %label{:for => "page_html", :style => "display:block;"} Html (paste your html code and press convert)
      %textarea{:id => "page_html", :name => "page[html]", :style => "width:800px;height:250px;"}= @html || ""
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
  HTML
end

