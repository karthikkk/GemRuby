# Step_definitions using page objects
Then /^I should be on search results page$/ do
  on_page SearchResults do |page|
    page.verify_title
  end
end
Then /^I should be on sky shop page$/ do
  on_page SkyShop do |page|
    page.verify_title
  end
end
Then /^I should see different Sky TV packages$/ do
  on_page SkyTvPage do |page|
    page.verify_title
  end
end