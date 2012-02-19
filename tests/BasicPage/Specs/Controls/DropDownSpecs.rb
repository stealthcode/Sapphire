require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Drop Down control" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "it should show the item list" do
        Should Show :item_list
      end
      And "it should contain Item 1" do
        Should Contain :item_list => "Item 1"
      end
      And "it should contain Item 2" do
        Should Contain :item_list => "Item 2"
      end
      And "it should contain Item 3" do
        Should Contain :item_list => "Item 3"
      end
      And "it should contain Item 4" do
        Should Contain :item_list => "Item 4"
      end
      And "it should not contain Item 5" do
        Should Not Contain :item_list => "Item 5"
      end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "the item_list should be visible" do
        Should Show :item_list
      end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "the item list is set to Item 1" do
        Should Show :item_list => "Item 1"
      end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "the item list is not set to Item 2" do
        Should Not Show :item_list => "Item 2"
      end
  #-------------------------------------------------------------------------------
    When "the item list is set to item 4" do
      Set :item_list => "Item 4"
    end
      Then "the item list should display item 4" do
        Should Show :item_list => "Item 4"
      end
  #-------------------------------------------------------------------------------
end