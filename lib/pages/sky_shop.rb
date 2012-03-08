class SkyShop
  include PageObject

  select_list(:select_package, :name=>'redirectTeaser')
  image(:click_go, :value=>'Go')

  def verify_title
    @browser.title.should == 'Buy Sky now - Get bundles and offers on HD TV, broadband and calls'
  end

end