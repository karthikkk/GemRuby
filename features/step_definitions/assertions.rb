Then /^I should be on '(.*)'$/ do  |title|
  browser.title.should == title
end
