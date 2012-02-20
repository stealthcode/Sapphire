require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Complete keyword" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
    And "the user completes the page" do
      Complete BasicPage
    end
      Then "the button should be clicked" do
        Should Show :button_clicked => "button clicked"
      end
      And "the hyperlink should be clicked" do
        Should Show :link_clicked => "link clicked"
      end
      And "the first name should be Completed" do
        Should Show :first_name => "Completed"
      end
      And "the last name should be Completed" do
        Should Show :last_name => "Completed"
      end
      And "the drop down should have Item 3 selected" do
        Should Show :item_list => "Item 3"
      end
      And "radio 2 should be selected" do
        Should Be Selected :radio2
      end
      And "the check box should be checked" do
        Should Be Checked :checkbox
      end
  #-------------------------------------------------------------------------------
end