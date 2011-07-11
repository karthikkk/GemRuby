Given /I click the "(.*)" button/ do |element|
  click_button(element)
end

Given /I click the "(.*)" checkbox/ do |element|
  click_checkbox(element)
end

Given /I click the "(.*)" image/ do |element|
  click_image(element)
end

Given /I click the "(.*)" link/ do |element|
  click_link(element)
end

Given /I click the "(.*)" radio button/ do |element|
  click_radio_button(element)
end

Given /I click row "(.*)" in the "(.*)" table/ do |row, column, element|
  find_table(row, column, element)
end

Given /I select "(.*)" from "(.*)"/ do |option, element|
  click_select_list(option, element)
end

Given /I fill in the text field "(.*)" text "(.*)"/ do |element, text|
  find_text_field(element, text)
end

Given /^I am on (.+)$/ do |page_name|
  browser.goto(path_to(page_name))
end

Given /^I go to "([^\"]*)"$/ do |url|
  browser.goto(url)
end

Given /^I wait for "([^\"]*)" seconds$/ do |seconds|
  sleep seconds.to_i
end