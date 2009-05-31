When /^I go to (.+)$/ do |page_name|
  visit page_name
end

When /^I press "([^\"]*)"$/ do |button|
  click_button(button)
end

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value) 
end

Then /^I should see "([^\"]*)"$/ do |text|
  response.should contain(text)
end

And /^Save and Open Page$/ do
  save_and_open_page
end

