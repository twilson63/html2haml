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

  it "should convert html 2 haml via api json" do
    post '/api.json', {:page => { :html => "<h1>Hello World</h1>"}}.to_json, "CONTENT_TYPE" => "application/json"
    MultiJson.load(last_response.body)["page"]["haml"].should =~ /%h1 Hello World/
  end

  it "should convert html 2 haml with options via api json" do
    post '/api.json', {:page => { :html => "<input type='text'>" }, :options => { :html_style_attributes => true } }.to_json, "CONTENT_TYPE" => "application/json"
    MultiJson.load(last_response.body)["page"]["haml"].should include("%input(type=\"text\"")
  end

  it 'should not parse no page param via json' do
    post '/api.json'
    last_response.body.should == { :status => :error, :message => 'unable to parse json'}.to_json
  end

end
