require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Set keyword" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "first name is cleared" do
      Clear :first_name
    end
    And "first name is set to Jane" do
      Set :first_name => "Jane"
    end
      Then "Jane should be in the first name box" do
        Should Show :first_name => "Jane"
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