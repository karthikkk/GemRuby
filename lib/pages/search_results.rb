class SearchResults
  include PageObject

def verify_title
  @browser.title.should == "Search Results (Sky+ HD)"
end

end