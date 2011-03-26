# html2haml.heroku.com

html2haml is a sinatra web application that allows you to convert
html 2 haml.

It is currently using haml 3.0.25!

## Features
  
* html text to haml text
  
  Copy your html in the html text area and click on convert
  and html2haml will convert it to haml in the text box below.
  
* url to haml

  Enter a url to a web site and click submit
  html2haml will download the page and convert it to haml
  in the haml text area below
  
* Now you can use json to do your conversions

  # post {'page': { 'html': '<h1>Hello World</h1>' }}
  # and receive {'page': { 'html': '<h1>Hello World</h1>', 'haml': '%h1 Hello World' }}
  

## Requirements for Development

* Ruby 1.8.7
* Bundler

## Development

    git clone git://github.com/twilson63/html2haml.git
    
    bundle install
    
    # run tests
    rake
    
    # run application
    rackup
    
    # open browser to http://localhost:9292

## Having problems

Please post an issue in the issues

## How to contribute

Interested in adding a new feature to the application? Awesome!

* First clone the repository
* Write a test for your feature in the spec folder using rspec
* Write your new feature 
* Once your code is passing and re-factored send a pull request

## LICENSE

The MIT License

Copyright (c) 2008 Jack Russell Software Company

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.