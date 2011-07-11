require 'watir-webdriver/extensions/wait'
require 'net/http'
class Net::HTTP
  attr_accessor :connect_timeout
end

module BrowserExtensions
  include Watir::Wait

  def attach_to_window window_title
    window(:title => /.*?#{window_title}.*/).use
    self
  end

  def attach_to_newest_window
    windows.last.use
    Watir::Wait.until do
      self.body.exists?
    end

  end

  def popup_opened?
    windows.size > 1
  end


  def close_extra_windows
    windows.first.use
    windows.each do |window|
      window.close unless window == windows.first
    end
  end

  def visible_one elements
    element = elements.find { |element| element.visible? }
    return element unless element.nil?

    def element.exists?
      false
    end

    element
  end

  def get_page_element(thing)
    element = nil
    Watir::Wait.until do
      element = visible_one(buttons(:text, thing))
      element = visible_one(links(:text, thing)) unless element.exists?
      element = visible_one(elements_by_xpath("//*[@id='#{thing.to_variable_name}']")) unless element.exists?
      element = visible_one(elements_by_xpath("//*[@id='#{thing}']")) unless element.exists?
      element = visible_one(elements_by_xpath("//*[@name='#{thing.to_variable_name}']"))  unless element.exists?
      element = visible_one(elements_by_xpath("//*[@name='#{thing}']")) unless element.exists?
      element = visible_one(buttons(:value, thing)) unless element.exists?
      element = visible_one(links(:text, /.*?#{thing}.*/)) unless element.exists?
      element = visible_one(labels(:text, thing)) unless element.exists?
      element = visible_one(spans(:text, thing)) unless element.exists?
      element.exists?
    end
    element
  end

  def wait_for_page_to_load
    if (url =~ /^#{$environment_url}/)
      Watir::Wait.until(150) do
        get_page_element('service_status').exists?
      end
    end
  end

  def click thing
    get_page_element(thing).click
    wait_for_page_to_load()
  end

  def maximize
    execute_script "if (window.screen){window.moveTo(0, 0);window.resizeTo(window.screen.availWidth,window.screen.availHeight);};"
  end

  def take_screenshot(path)
    path = path.gsub(" ", "_").downcase
    FileUtils.mkdir_p(File.dirname(path))
    puts "#{title}"
    if RUBY_PLATFORM.include? "win"
      require 'win32screenshot'
      maximize
      width, height, bmp = Win32::Screenshot.window(/#{title}/, 1)
      img = Magick::Image.from_blob(bmp).first
      img.write("#{path}.png")
    else
      driver.save_screenshot("#{path}.png")
    end
  end

  def find_element name_or_id
    elements = elements_by_xpath("//*[@id='#{name_or_id.to_variable_name}' or @name='#{name_or_id.to_variable_name}' or @id='#{name_or_id}' or @name='#{name_or_id}']")
    raise "More than one element found for name or id:#{name_or_id}" if elements.size > 1
    return elements[0]
  end

  def remove_cookies pattern=nil
    navigate_to_page_in_application_domain
    $browser.driver.manage.all_cookies.each do |cookie|
      if (pattern.nil? || cookie[:name] =~ pattern)
        $browser.driver.manage.delete_cookie cookie[:name]
      end
    end
  end

  def remove_cookie(name)
    navigate_to_page_in_application_domain
    $browser.driver.manage.delete_cookie name
  end

  def set_cookie(name, value)
    navigate_to_page_in_application_domain
    $browser.driver.manage.add_cookie :name => name, :value => value, :path => '/', :domain => '.bskyb.com'
  end

  def get_cookie(name)
    navigate_to_page_in_application_domain
    $browser.driver.manage.cookie_named(name)[:value] rescue nil
  end

  def navigate_to_page_in_application_domain
    goto $environment_url unless page_in_application_domain?
  end

  def page_in_application_domain?
    $browser.url =~ /b?skyb?\.com\//
  end

  def radio_button name, value
    radio({:name=> name, :value => value})
  end

end

class Watir::Browser
  include BrowserExtensions
  attr_accessor :window_index, :marked_window_index
end

class Watir::Element
  alias_method :original_click, :click

  def value_or_text
    self.is_a?(Watir::Input) ? self.value : self.text
  end

  def click
    original_click
      end

#  def ajax_completed?
#    !ajax_in_progress?
#  end
#
#  def ajax_in_progress?
#    $browser.execute_script "return typeof(ajaxIsInProgress) != 'undefined' && ajaxIsInProgress"
#  end
#
#  def wait_for_ajax_completion
#     Watir::Wait.until(15) do
#      ajax_completed?
#    end
#  end

#  def register_event_handlers
#     $browser.execute_script <<SCRIPT
#     try{
#       ajaxIsInProgress = false;
#       $(document).ajaxStart(function(){ ajaxIsInProgress=true; });
#       $(document).ajaxStop(function(){ ajaxIsInProgress = false; })
#       $.fx.off = true;
#     } catch(e) {  }
#SCRIPT
#  end

end
