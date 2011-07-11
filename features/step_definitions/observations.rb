#AfterStep do |scenario|
#  track_time 'atatching to windows' do
#    browser.attach_to_newest_window if browser.popup_opened?
#
#  end
#end

Then /^I should be on (popup|page) titled '([^']*)'$/ do |type, title|
  if type == 'popup'
    fail "No popup was opened" unless browser.popup_opened?
  end
  browser.title.should_include?(title)
end

Then /^I should see '(.*)'$/ do |text|
  i_should_see text.normalize_spaces
end

Then /^I should see:$/ do |table|
  messages = table.raw.flatten.collect { |cell| cell.remove_quotes.normalize_spaces }
  i_should_see messages
end

Then /^I should see in table '([^']*)':$/ do |table_id, expected_table|
  actual = browser.table(:class, table_id).to_a
  expected = expected_table.raw
  if expected != actual
    fail "\nExpected#{expected.to_table_string} \nActual#{actual.to_table_string}"
  end
end

Then /^I should not see '(.*)'$/ do |text|
  i_should_not_see text
end

Then /^I should see section with heading '([^']*)'$/ do |heading_text|
  heading = heading_with_text(heading_text)
  fail "Section with heading '#{heading_text}' was not found in page: #{browser_text}" unless heading.exists?
  fail "Section with heading '#{heading_text}' was not visible in page: #{browser_text}" unless heading.visible?
end

Then /^I should not see section with heading '([^']*)'$/ do |heading_text|
  heading = heading_with_text(heading_text)
  fail "Section with heading '#{heading_text}' was visible in page: #{browser_text}" if heading.exists? and heading.visible?
end

Then /^I should not see:$/ do |table|
  messages = table.raw.flatten.collect { |cell| cell.remove_quotes.normalize_spaces }
  i_should_not_see messages
end

Then /^I should see that list '([^']*)' has '([^']*)' selected$/ do |name, selected|
  fail "'#{selected}' is not selected in the '#{name}' list" unless browser.select_list(:name, name).selected_options.include?(selected)
end



Then /^the '([^']*)' button is disabled$/ do |name_or_id|
  element = browser.find_element(name_or_id)
  fail "Could not find element '#{name_or_id.to_variable_name}'" unless element.exists?
  element.class_name.should_include?('disabled')
end

Then /^the '([^']*)' button is enabled$/ do |name_or_id|
  element = browser.find_element(name_or_id)
  fail "Could not find element '#{name_or_id.to_variable_name}'" unless element.exists?
  element.class_name.should_not_include?('disabled')
end

Then /^'([^']*)' should be decorated by (.*)/ do |text, css_class|
  element = browser.element_by_xpath("//*[text()='#{text}' and contains(@class, '#{css_class}')]")
  fail "Could not find selected element with text #{text}" unless element.exists?
end

When /^I should see the '([^']*)'.*$/ do |name_or_id|
  element = browser.find_element(name_or_id)
  fail "Element '#{name_or_id}' is not visible" unless element.exists? && element.visible?
end

When /^I should not see the '([^']*)'.*$/ do |name_or_id|
  element = browser.find_element(name_or_id)
  fail "Element '#{name_or_id}' is visible" if element.exists? && element.visible?
end

When /^I should see in the '([^']*)'.*$/ do |name_or_id, table|
  element = browser.find_element(name_or_id)
  Then "I should see the '#{name_or_id}'"
  messages = table.raw.flatten.collect { |cell| cell.normalize_spaces }
  element.value_or_text.normalize_spaces.should_include?(messages)
end

Then /^I should see '([^']*)' in the '([^']*)'.*$/ do |text, name_or_id|
  element = browser.find_element(name_or_id)
  Then "I should see the '#{name_or_id}'"
  element.value_or_text.normalize_spaces.should_include?(text)
end

When /^I should not see '([^']*)' in the '([^']*)'.*$/ do |text, name_or_id|
  element = browser.find_element(name_or_id)
  Then "I should see the '#{name_or_id}'"
  element.value_or_text.should_not_include?(text)
end

private
def browser_text
  browser.text.normalize_spaces
end

def heading_with_text(heading_text)
  heading = browser.element_by_xpath("//h5[text()='#{heading_text}']")
  heading =  browser.element_by_xpath("//h4[text()='#{heading_text}']") unless heading.exists?
  return heading
end

Then /^I should be on '([^']*)'$/ do |text|
  unless browser.title == text || browser.title == "Sky.com - My Sky>#{text}"
#    element = browser.element(:css, ".header h3")
#    element = browser.element(:css, ".tab.selected a") unless element.exists? && element.text != ''
#    fail "Could not find title in the page" unless element.exists?
#    element.text.should_include?(text)
  end
end

Then /^Link: '([^']*)' goes to '([^']*)' in (the same window|a popup)$/ do |name, url, location|
  link = browser.link(:name, name.to_variable_name)
  target = location.include?('popup') ? '_blank' : '_self'

  fail "Link href mismatch: expected '#{url}', got '#{link.href}'" unless link.href == url
  fail "link does not open in #{location}" unless link.target.downcase == target
end

When /^Link: '([^']*)' is not shown$/ do |name|
  link = browser.link(:name, name.to_variable_name)
  fail "Link '#{name}' is shown" if link.exists?
end

When /^Link: '([^']*)' is shown$/ do |name|
  link = browser.link(:name, name.to_variable_name)
  fail "Link '#{name}' is not shown" unless link.exists?
end

Then /^I should be on the My Account home page$/ do
  Then "I should be on 'Current bill'"
end

And /^(\d+) email should be sent$/ do | expected_count |
  actual_count = File.read('/var/tmp/mailtrap.log').scan('Message ends').length
  fail "Expected #{expected_count} email(s), got #{actual_count}" unless Integer(expected_count) == actual_count
end

When /^I should see that tab group '([^']*)' has '([^']*)' selected$/ do |group_name, text|
  element = browser.element_by_xpath "//div[@id='#{group_name}']//li[contains(@class,'ui-tabs-selected')]"
  fail "Tab group #{group_name} was not found or did not have any selected tabs" unless element.exists?
  element.text.should_include?(text)
end

Then /^the '(.*?)' message should be (above|below) the '(.*?)' .*/ do |first, location, second|

  case location
    when 'above' then fail "#{first} is not above #{second}" unless browser.html.index(first.to_variable_name) < browser.html.index(second.to_variable_name)
    when 'below' then fail "#{first} is not below #{second}" unless browser.html.index(first.to_variable_name) > browser.html.index(second.to_variable_name)
  end
end
Then /^I should see the link with text '(.*?)' goes to '(.*?)' in a popup$/ do |text, href|
  link = browser.link(:text => text, :href => href)
  fail ("link does not exist") unless link.exists?
  fail ("link does not open in a popup") unless link.target.downcase == "_blank"
end

Then /^I should see the link with text '(.*?)' and url'(.*?)'$/ do |text, href|
  link = browser.link(:text => text, :href => href)
  fail ("link does not exist") unless link.exists?
  end

Then /^the '([^']*)'.*? should be empty$/ do |name_or_id|
  element = browser.find_element(name_or_id)
  fail "Could not find element '#{name_or_id}'" unless element.exists?
  element.value_or_text.normalize_spaces.should == ''
end

Then /^the '([^']*)'.*? should not be empty$/ do |name_or_id|
  element = browser.find_element(name_or_id)
  fail "Could not find element '#{name_or_id}'" unless element.exists?
  element.value_or_text.normalize_spaces.should_not == ''
end


Then /^I should see that the (next|previous) page link is (enabled|disabled)$/ do |direction, style|
  element = browser.element_by_xpath("//span[@class='#{direction}#{style == "enabled" ? "" : " #{style}"}']")
  fail "#{direction} page link is not #{style}" unless element.exists?
end

When /^Tab '(.*)' should be selected$/ do |tab_name|
      element = browser.element(:css, ".tab.#{tab_name}.selected")
      fail "tab #{tab_name} is not selected" unless element.exists?
end

When /^the field '(.*)' should be checked$/ do |id|
  fail "Field #{id} is not checked" unless browser.checkbox({:id => id}).checked?
end

#When /^I should see £(.*) in the (.*) column$/ do | value, column |
#  display_mode = ENV['display_mode'] || 'screen'
#      elements = browser.elements_by_xpath("//span[@class='#{column}']")
#      element_found = false;
#      elements.each do |element|
#        if element.text() == "£#{value}"
#          element_found = true;
#          break;
#        end
#      end
#      fail ("#{value} not found in the #{column} column") unless element_found
#
#end