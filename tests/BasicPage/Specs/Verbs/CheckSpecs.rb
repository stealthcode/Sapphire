require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the RadioButton control" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user checks the check box" do
      Check :checkbox
    end
      Then "the check box should be checked" do
        Should Be Checked :checkbox
      end
  #-------------------------------------------------------------------------------
    When "the check box is checked" do
      Check :checkbox
      Should Be Checked :checkbox
    end
    And "the check box is checked again" do
      Check :checkbox
    end
      Then "the check box should be checked" do
        Should Be Checked :checkbox
      end
  #-------------------------------------------------------------------------------
    When "the check box is checked" do
      Check :checkbox
      Should Be Checked :checkbox
    end
      And "the check box is unchecked" do
        Uncheck :checkbox
      end
      Then "the check box should be unchecked" do
        Should Not Be Checked :checkbox
      end
  #-------------------------------------------------------------------------------
end