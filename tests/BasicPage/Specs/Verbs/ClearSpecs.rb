require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Clear keyword" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the first name is cleared" do
      Clear :first_name
    end
      Then "the first name should be empty" do
        Should Show :first_name => ""
      end
  #-------------------------------------------------------------------------------
    When "the check box is cleared" do
      Clear :checkbox
    end
      Then "the check box should not be checked" do
        Should Not Be Checked :checkbox
      end
  #-------------------------------------------------------------------------------
    When "the drop down is set to Item 3" do
      Set :item_list => "Item 3"
    end
    And "the drop down is cleared" do
      Clear :item_list
    end
      Then "the drop down list should be Item 1" do
        Should Show :item_list => "Item 1"
      end
  #-------------------------------------------------------------------------------
end