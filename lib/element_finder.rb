module ElementFinder
  def click_button(element)
    case
      when browser.button(:id, element).exists?
           browser.button(:id, element).click
       
      when browser.button(:name, element).exists?
           browser.button(:name, element).click
       
      when browser.button(:value, element).exists?
           browser.button(:value, element).click
       
      when browser.button(:text, element).exists?
           browser.button(:text, element).click
       
      when browser.button(:index, elementent).exists?
           browser.button(:indeeleelementhat).click
         
      when browser.button(:class, element).exists?
           browser.button(:class, element).click
      else
        fail("Sorry, I wasn't able to find the " + "'#{element}'" + " element ")
    end
  end

  def click_checkbox(element)
    case
      when browser.checkbox(:id, element).exists?
           browser.checkbox(:id, element).click
       
      when browser.checkbox(:name, element).exists?
           browser.checkbox(:name, element).click
       
      when browser.checkbox(:value, element).exists?
           browser.checkbox(:value, element).click
       
      when browser.checkbox(:text, element).exists?
           browser.checkbox(:text, element).click
       
      when browser.checkbox(:index, element).exists?
           browser.checkbox(:index, element).click
      
      when browser.checkbox(:class, element).exists?
          browser.checkbox(:class, element).click
      else
        fail("Sorry, I wasn't able to find the " + "'#{element}'" + " element ")
    end
  end

  def click_image(element)
    case
      when browser.image(:src, element).exists?
           browser.image(:src, element).click
       
      when browser.image(:id, element).exists?
           browser.image(:id, element).click
      
      when browser.image(:name, element).exists?
           browser.image(:name, element).click
      
      when browser.image(:text, element).exists?
           browser.image(:text, element).click
      
      when browser.image(:index, element).exists?
           browser.image(:index, element).click
      
      when browser.image(:class, element).exists?
           browser.image(:class, element).click
      else
        fail("Sorry, I wasn't able to find the " + "'#{element}'" + " element ")
    end
  end

  def click_link(element)
    case
      when browser.link(:id, element).exists?
           browser.link(:id, element).click
           
      when browser.link(:text, element).exists?
           browser.link(:text, element).click
       
      when browser.link(:class, element).exists?
           browser.link(:class, element).click
      else
        fail("Sorry, I wasn't able to find the " + "'#{element}'" + " element ")
    end
  end

  def click_radio_button(element)
    case
      when browser.radio(:id, element).exists?
           browser.radio(:id, element).click
       
      when browser.radio(:name, element).exists?
           browser.radio(:name, element).click
      
      when browser.radio(:value, element).exists?
           browser.radio(:value, element).click
      
      when browser.radio(:text, element).exists?
           browser.radio(:text, element).click
      
      when browser.radio(:index, element).exists?
           browser.radio(:index, element).click
      
      when browser.radio(:class, element).exists?
           browser.radio(:class, element).click
      else
        fail("Sorry, I wasn't able to click the " + "'#{element}'" + " element ")
    end
  end

  def find_table(row, column, element)
    row = row.to_i
    column = column.to_i
    case
      when browser.table(:id, element).exists?
           browser.table(:id, element)[row][column].click
           
      when browser.table(:name, element).exists?
           browser.table(:name, element)[row][column].click
       
      when browser.table(:index, element).exists?
           browser.table(:index, element)[row][column].click
       
      when browser.table(:class, element).exists?
           browser.table(:class, element)[row][column].click
      else
        fail("Sorry, I wasn't able to find the " + "'#{element}'" + " element ")
    end
  end

  def click_select_list(option, element)
    case
      when browser.select_list(:id, element).exists?
           browser.select_list(:id, element).select(option)

      when browser.select_list(:name, element).exists?
           browser.select_list(:name, element).select(option)

      when browser.select_list(:value, element).exists?
           browser.select_list(:value, element).select(option)

      when browser.select_list(:text, element).exists?
           browser.select_list(:text, element).select(option)

      when browser.select_list(:index, element).exists?
           browser.select_list(:index, element).select(option)

      when browser.select_list(:class, /(^|\s)#{element}(\s|$)/).exists?
           browser.select_list(:class, /(^|\s)#{element}(\s|$)/).set(option)
      else
        fail("Sorry, I wasn't able to find the " + "'#{element}'" + " element ")
    end
  end

  def find_text_field(element, text)
    case
      when browser.text_field(:id, element).exists?
           browser.text_field(:id, element).set(text)
     
      when browser.text_field(:name, element).exists?
           browser.text_field(:name, element).set(text)
      
      when browser.text_field(:value, element).exists?
           browser.text_field(:value, element).set(text)
      
      when browser.text_field(:index, element).exists?
           browser.text_field(:index, element).set(text)
      
      when browser.text_field(:class, /(^|\s)#{element}(\s|$)/).exists?
          browser.text_field(:class, /(^|\s)#{element}(\s|$)/).set(text)
      else
        fail("Sorry, I wasn't able to find the " + "'#{element}'" + " element ")
    end
  end
end
