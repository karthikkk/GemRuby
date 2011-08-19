class SkyTvPage
  include PageObject

  def verify_title
    @browser.title.should == 'Buy Sky now - Get bundles and offers on HD TV, broadband and calls'
  end
end