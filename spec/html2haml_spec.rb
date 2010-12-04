require 'spec_helper'

describe 'html2haml app' do
  def app
    Sinatra::Application
  end


  it "should be valid" do
    get '/'
    last_response.body.should =~ /HTML2Haml/
  end

  it "should convert html 2 haml via past" do
    post '/', :page => { :html => "<h1>Hello World</h1>"}
    last_response.body.should =~ /%h1 Hello World/
  end
  
  it "should convert html 2 haml via url" do
    post '/url', :q => 'jackhq.com'
    last_response.body.should =~ /Jack Russell Software/
  end
  
  it "should convert html 2 haml via api xml" do
    post '/api.xml', :page => { :html => "<h1>Hello World</h1>"}
    last_response.body.should =~ /%h1 Hello World/
  end
  
  it 'should not parse no page param via xml' do
    post '/api.xml'
    last_response.body.should_not =~ /%h1 Hello World/
  end

end
