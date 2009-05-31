require "haml"
require "haml/html"

get "/" do
  haml :index
end

post "/" do
  #%x("html2haml #{params[:html]}")
  #input = params[:html]
  @html = params["page"]["html"]
  @haml = Haml::HTML.new(@html).render
  haml :index
  #params.inspect
end


template :index do
  <<-HTML  
%html
  %body
    %h1 Html2Haml

    %form{:method => "POST", :action => "/", :id => "page"}
      %label{:for => "page_html", :style => "display:block;"} Html
      %textarea{:id => "page_html", :name => "page[html]", :style => "width:800px;height:250px;"}
        = @html || ""
      %br
      %input{:type => "submit", :name => "commit", :value => "Convert", :style => "margin:20px;text-aligin:center;"}
      %br
      %label{:for => "page_html", :style => "display:block;"} Haml      
      %textarea{:id => "page_haml", :name => "page[haml]", :style => "width:800px;height:250px;"}
        = @haml || ""
  HTML
end

