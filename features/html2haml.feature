Feature: Convert Html 2 Haml
  In order to convert html 2 haml
  As a guest
  I want to copy a snippet of html into a text box and press covert to haml and display the haml in a results text area
  
  @current
  Scenario: Copy Html and Convert to Haml
    Given I go to /
    And I fill in "Html" with "<h1>Hello World</h1>"
    When I press "Convert"
    Then I should see "%h1"