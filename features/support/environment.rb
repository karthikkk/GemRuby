$:.unshift "#{File.dirname(__FILE__)}/../../lib"
require 'rubygems'
require "spec"
require "browser_world"
require 'bundler/setup'
require 'fileutils'
require 'cucumber'
require 'rake'
require 'watir-webdriver'
require "string"
require "element_finder"

include ElementFinder

$url = {:google=> 'http://www.google.co.uk', :facebook=>'http://www.facebook.com'}

World(BrowserWorld)

After do
  browser.close unless browser.nil?
end


