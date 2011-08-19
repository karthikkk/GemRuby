class Homepage
  include PageObject

  page_url "http://www.sky.com"
  button(:search_button, :name=>'sky-header-search-submit')
  text_field(:search_box, :name=>'query')
  link(:shop, :text=>'Shop')

end
