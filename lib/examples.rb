#Drap and Drop:

  def drag_and_drop_tv_module_above_sky_products_module
    tv_module = @browser.div(:id, 'tv-module-container')
    products_module = @browser.div(:id, 'sky_products_module')
    products_module.wd.location_once_scrolled_into_view
    sleep 2
    tv_module.drag_and_drop_on products_module
  end


#GSUB:

def get_publisher_info_build_no
  @publisher_build_number =(@browser.lis.first.text).gsub("buildNumber : ", "")
end


#Disable_Animation:

  def disable_anims
    @browser.execute_script("$('body').trigger('turnFxOff')");
  end

  def check_default_focus
    search_field_text_area = 'skycom-header-search-input-1'
    @browser.execute_script('return document.activeElement').id.should == search_field_text_area
  end

#Fire_event:

 def click_somewhere
    @browser.element(:id, 'search-type-video').fire_event('onclick')
    subsection.fire_event('onmouseover')
  end

#Check_first_chaaracter:

  def check_auto_suggest_list alphabet
    auto_suggest_list = @browser.ul(:id, 'autosuggest_inner').lis.map{|a|a.text}
    auto_suggest_list.each{|result|result[0].chr.should == alphabet}
  end

#Click:

  def click link, el = false
    if (!el) then
      el = @browser
    end
    begin
      el.element(:class, link.gsub(" ", "-")).fire_event('onclick')
    rescue
      begin
        el.element(:id, link.gsub(" ", "-")).fire_event('onclick')
      rescue
        begin
          el.input(:value, link).fire_event('onclick')
        rescue
          begin
            el.a(:text=>link).when_present.click
          rescue
            begin
              el.element(:value=>link).when_present.click
            end
            raise "Not Found: #{link}\nWithin: #{el}"
          end
        end
      end
    end
  end

#Wait_for:
  def loaded?
    wait_until{@browser.title == 'Edit Footer Module'}
  end

 def loaded?
    wait_for 'id', 'skycom_homepage'
  end

def wait_for type, element, expected=0
    exists = false
    count = 150 #15seconds
    while count > 0 and !exists
      sleep 0.1
      count = count - 1
      case type
        when 'metatag'
          exists = (@browser.meta(:name, element).content == expected.upcase.gsub(' ','_'))
        when 'id'
          exists = (@browser.elements(:id, element).count > 0)
        when 'class'
          exists = (@browser.elements(:class, element).count > 0)
        when 'title'
          exists = (@browser.title == element)
        when 'list'
          exists = (@browser.div(:class, element).ul.lis.count == expected.to_i)
        when 'style'
          exists = (@browser.div(:id, element).style == expected)
        when 'h1'
          exists = (@browser.element(:h1, element).style == expected)
        else
          sleep 2
          exists = (@browser.text.include? text)  #include? is dodgey
      end
    end
    exists.should == true
  end

#Handle_javascript_pop-up

 def delete_sitemap_page_and_handle_js_popup
    @browser.confirm(true) do
      @browser.button(:value, 'Delete').click
    end
  end
