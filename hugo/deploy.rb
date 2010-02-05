#!/usr/local/bin/ruby 
require 'rubygems'
require 'hugo'

config = YAML.load_file(File.join(File.dirname(__FILE__),'html2haml.yml'))


Hugo do 
  cloud "jackapps" do
    # database "jackdocs_production" do
    #   server "jackhq"
    #   user "jackadmin"
    #   password "jackdogbyte"
    # end
    #   
    #balancer
    
    app "html2haml" do
      # ec2 private key
      key_name "ec2-keypair"      
      key_path "~/.ec2"
      cookbook "git://github.com/jackhq/hugo-cookbooks.git"
      
      run_list ["role[base-rack-apache]"]
    
      add_recipe 'github_keys', :github => {  
                    :url => "git@github.com:twilson63", 
                    :publickey => config["github"]["publickey"], 
                    :privatekey => config["github"]["privatekey"]
                  }
    
      add_recipe 'apache2'
      add_recipe 'packages', :package_list => config["package_list"]
      add_recipe 'gems', :gem_list => config["gem_list"]

      add_recipe 'apache2::mod_deflate'
      add_recipe 'apache2::mod_rewrite'
      add_recipe 'hugo_deploy', :hugo => {
                :app => {
                  :name => 'html2haml',
                  :url => 'html2haml.jackrussellsoftware.com',
                  :branch => 'HEAD',
                  :migrate => false,
                  :restart_command => 'bundle install && touch tmp/restart.txt',
                  :web => { :port => '80', :server_name => 'html2haml.jackfile.com'} 
                }  
              }
      
      instance "i-768f9d1e"
      servers 1
    end
    
    deploy
    
    print
  end
end
