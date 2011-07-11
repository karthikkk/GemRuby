$:.unshift "#{File.dirname(__FILE__)}/../../lib"
require 'rubygems'
require "browser_world"
require "string"
require 'bundler/setup'
require 'fileutils'
require 'cucumber'
require 'rake'
#require 'rspec'
require 'watir-webdriver'
require 'browser_extensions'


World(BrowserWorld)

After do
  browser.close unless browser.nil?
end


