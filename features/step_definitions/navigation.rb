Given /^I visit Sky homepage$/ do
  visit_page Homepage
end

When /^I search for '(.+)'$/ do |text|
  on_page Homepage do |page|
    page.search_box = text
    page.search_button
  end
end
When /^I goto sky shop$/ do
  on_page Homepage do |page|
    page.shop
  end
end
When /^I select Sky TV$/ do
  on_page SkyShop do |page|
    page.select_package='High definition TV with Sky+HD'
    page.click_go_image
  end
end