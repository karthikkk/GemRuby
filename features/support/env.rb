require 'rubygems'
require "spec"
require 'bundler/setup'
require 'fileutils'
require 'cucumber'
require 'rake'
require 'watir-webdriver'
require "page-object"
require "page-object/page_factory"
Dir["#{File.dirname(__FILE__)}/../../lib/pages/*.rb"].each{|page| load  page}

browser = Watir::Browser.new :firefox

Before do
@browser = browser
end

After do
  browser.close unless browser.nil?
end

World (PageObject::PageFactory)



