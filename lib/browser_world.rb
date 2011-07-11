module BrowserWorld

  def browser
    case ENV['browser']
      when 'ie' then  @browser ||= Watir::Browser.new :ie
      when 'chrome' then  @browser ||= Watir::Browser.new :chrome
      else
        @browser ||= Watir::Browser.new :firefox
    end
  end

  def i_should_see text
    browser.text.normalize_spaces.should_include? text
  end

  def i_should_not_see text
    browser.text.normalize_spaces.should_not_include? text
  end

end

# if RUBY_PLATFORM.include? "win"



