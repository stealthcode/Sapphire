require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Exists keyword with controls" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "a radio button exists" do

    end
      Then "the radio button should show" do
        if(Exists :radio1)
          Should Show :radio1
        else
          Should Show :radio1
        end
      end
  #-------------------------------------------------------------------------------
    When "a label exists" do

    end
      Then "the label should show" do
        if(Exists :welcome)
          Should Show :welcome
        else
          Should Show :welcome
        end
      end
  #-------------------------------------------------------------------------------
    When "a textbox exists" do

    end
      Then "the textbox should show" do
        if(Exists :first_name)
          Should Show :first_name
        else
          Should Show :first_name
        end
      end
  #-------------------------------------------------------------------------------
    When "a hyperlink exists" do

    end
      Then "the hyperlink should show" do
        if(Exists :link_click_me!)
          Should Show :link_click_me!
        else
          Should Show :link_click_me!
        end
      end
  #-------------------------------------------------------------------------------
    When "a button exists" do

    end
      Then "the button should show" do
        if(Exists :click_me!)
          Should Show :click_me!
        else
          Should Show :click_me!
        end
      end
  #-------------------------------------------------------------------------------
    When "a list exists" do

    end
      Then "the list should show" do
        if(Exists :value_list)
          Should Show :value_list
        else
          Should Show :value_list
        end
      end
  #-------------------------------------------------------------------------------
    When "a dropdown exists" do

    end
      Then "the dropdown should show" do
        if(Exists :item_list)
          Should Show :item_list
        else
          Should Show :item_list
        end
      end
  #-------------------------------------------------------------------------------
end