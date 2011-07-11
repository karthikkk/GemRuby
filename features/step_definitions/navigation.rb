When /^I login at '(.*)' with username '(.*)' and password '(.*)'$/ do |url, username, password|
  begin
    browser.goto(url)
    @user = User.new username, password
    login
  rescue Watir::Wait::TimeoutError => e
    puts "Timed out trying to login, retrying in 30 seconds"
    sleep 30
    retry
  end

end

When /^I click '(.*)'/ do |value|
  browser.click value
end

And /^I click button '(.+)'$/ do |button|
  browser.button(:id, button).click
end

When /^I click link named '(.*)'$/ do |link_name|
  browser.click(link_name.to_variable_name)
end

When /^I click button '(.*)' in the '(.*)' section$/ do |link_text, section|
  browser.element_by_xpath("//div[contains(@id, '#{section}')]//*[@value='#{link_text}']").click
end

When /^I (check|uncheck) '(.*)'$/ do |_, value|
  browser.click value
end

When /^I click element with class '(.*)' in the '(.*)' section$/ do |class_to_find, section|
  browser.element_by_xpath("//div[contains(@id, '#{section}')]//*[contains(@class,'#{class_to_find.to_variable_name}')]").click
end

When /^I click element with class '(.*)'$/ do |class_to_find|
  browser.element_by_xpath("//*[contains(@class,'#{class_to_find.to_variable_name}')]").click
end

Then /^I should see text '(.*)' in the '(.*)' cell in the '(.*)' section$/ do |text, class_to_find, section|
  element = browser.element_by_xpath("//div[contains(@id, '#{section}')]//td[contains(@class,'#{class_to_find.to_variable_name}')]")
  element.value_or_text.normalize_spaces.should_include?(text)
end

Then /^I should see text '(.*)' in the '(.*)' cell$/ do |text, class_to_find|
  element = browser.element_by_xpath("//td[contains(@class,'#{class_to_find.to_variable_name}')]")
  element.value_or_text.normalize_spaces.should_include?(text)
end

When /^I wait (.*) second.*$/ do |seconds|
  sleep seconds.to_f
end

When /^I click section '(.*)'$/ do |section|
  browser.element_by_xpath("//div/h5[text()='#{section}']").click
end

When /^I click the '(.*)'.*$/ do |name_or_id|
  browser.click(name_or_id)
end


When /^I submit the iframe name '(.+)' as '(.+)'$/ do |frame_name, form_name|
  browser.frame(:name, frame_name).form(:name, form_name).submit
end

When /^I go to '(.*)'$/ do |url|
  browser.goto(url)
end

def input field, value
  form_element = browser.element_by_xpath("//*[@name='#{field}']")
  form_element = browser.element_by_xpath("//*[@id='#{field}']") unless form_element.exists?

  if form_element.exists?
    case form_element.type
      when 'radio' then
        browser.radio_button(field, value).set
      when 'checkbox' then
        browser.checkbox(:name, field).set
      when 'select-one' then
        browser.select_list(:name, field).select value
      when 'text', 'password' then
        browser.text_field(:name, field).set(value)
      else
        form_element.click
    end
  else
    browser.click(field)
  end
end

def goto_home_page
  browser.goto($environment_url)
end

When /^I tick '(.*)'$/ do |name|
  browser.checkbox(:name, name).click
end

Then /^I enter '(.*)' as '(.*?)'$/ do|field, value|
  browser.text_field(:name, field).set(value)
end

When /^I select '(.*)' as '(.*)'$/ do |field_name, value|
  browser.select_list(:name, field_name).select(value)
end

When /^I choose '(.*)' as '(.*)'$/ do |field_name, value|
  browser.radio_button(field_name, value).set
end

When /^I check '(.*)' '(.*)'$/ do |name, value|
  browser.checkbox(:name, name, value).click
end

When /^I (expand|collapse) the '(.*)' section$/ do |action,section_name|
  expand_section section_name
end

When /^I remove cookie '(.*)'$/ do |name|
  browser.remove_cookies /name/
end

Given /^I set cookie '(.*)'$/ do |name|
  browser.set_cookie(name)
end

When /^I click link '(.*)' in the '(.*)' section$/ do |link_name, section_name|
  browser.element_by_xpath("//div[contains(@id, '#{section_name.to_variable_name}')]//*[@name='#{link_name.to_variable_name}']").click
end