#Before do
#  track_time 'setting up cookies' do
#    browser.remove_cookies
#    enable_feature 'mock printing'
#  end
#end
#
#def remove_cookie(name)
#   browser.remove_cookie(name)
# end
#
# def set_cookie(name, value)
#   browser.set_cookie(name, value)
# end
#
# def cookie_name(feature)
#   "enable_#{feature}".to_variable_name
# end
#
#def disable_feature feature
#  remove_cookie(cookie_name(feature))
#end
#
#When /^'(mysky navigation)' is (enabled|disabled)$/ do |feature, state|
#  if (state == 'enabled')
#    enable_feature(feature)
#  else
#    disable_feature(feature)
#  end
#end
#
#Given /^I have seen the '(.*)' banner$/ do |banner_name|
#  set_cookie('banner', banner_name)
#end
#
#When /^customer has previously selected account id '(.*)'$/ do |account_id|
#  set_cookie('MyBillAcc', java_hash_code(account_id))
#end
#
#When /^I should see that account id '(.*)' was previously selected$/ do |account_id|
#  cookie_value = browser.get_cookie('MyBillAcc')
#  fail 'Could not find cookie for a selected account' unless cookie_value
#  cookie_value.should == java_hash_code(account_id)
#end
#
#def java_hash_code string
#  require 'java'
#  java.lang.String.new(string).hashCode().to_s
#end
#
#Then /^I should see that no account was previously selected$/ do
#  fail "An account was previously selected!" if browser.get_cookie("MyBillAcc")
#end