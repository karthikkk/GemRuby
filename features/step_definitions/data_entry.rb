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

When /^I change my billing preference$/ do
  value = browser.radio_button('issuePaperBills', 'pb').checked? ? 'onl' : 'pb'
  browser.radio_button('issuePaperBills', value).set
end

#When /^I set the threshold slider to (Off|£20|£30|£40|£50)$/ do |value|
#  slider_value = value == "Off"  ? 10 : value[2..-1]
#  browser.execute_script "$('#slider').slider('value', '#{slider_value}')"
#end
#
#When /^I should see (Off|£20|£30|£40|£50) in the threshold slider$/ do |expected|
#  actual = browser.execute_script("return $('.marker.pinkFont').text()")
#  actual = actual == 10 ? 0 : actual
#  fail "Expected '#{expected}', got '#{actual}'" unless actual == expected
#end

