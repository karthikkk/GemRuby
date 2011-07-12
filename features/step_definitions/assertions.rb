Then /^I should be on '(.*)'$/ do  |title|
  browser.title.should == title
end

When /^I should see the text '(.+)'$/ do  |expected_text|
  begin
  browser.text.should include(expected_text)
  rescue Spec::Expectations::ExpectationNotMetError
  raise "Cannot find the expected text '#{expected_text}' "
    end
end

When /^I should see a button '(.+)'$/ do |button_text|
  begin
  browser.button(:value, button_text).should exist
  rescue Spec::Expectations::ExpectationNotMetError
    raise "Sorry, cannot find the expected button '#{button_text}' "
    end
end

When /click on the link '(.+)'/i do |link_text|
  begin
  browser.link(:text, /#{Regexp.escape(link_text)}/i).click
  rescue Watir::Exception::UnknownObjectException
    raise "Sorry, cannot find the expected link '#{link_text}' "
    end
end