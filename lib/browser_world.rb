module BrowserWorld

  def browser
    case ENV['browser']
      when 'ie' then  @browser ||= Watir::Browser.new :ie
      when 'chrome' then  @browser ||= Watir::Browser.new :chrome
      else
        @browser ||= Watir::Browser.new :firefox
    end
  end
end





