Given /I click the "(.*)" button/ do |what|
  find_button(what)
end

Given /I click the "(.*)" checkbox/ do |what|
  find_checkbox(what)
end

Given /I click the "(.*)" image/ do |what|
  find_image(what)
end

Given /I click the "(.*)" link/ do |what|
  find_link(what)
end

Given /I click the "(.*)" radio button/ do |what|
  find_radio_button(what)
end

Given /I click row "(.*)" in the "(.*)" table/ do |row, column, what|
  find_table(row, column, what)
end

Given /I select "(.*)" from "(.*)"/ do |option, what|
  find_select_list(option, what)
end

Given /I fill in the text field "(.*)" with "(.*)"/ do |what, with|
  find_text_field(what, with)
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