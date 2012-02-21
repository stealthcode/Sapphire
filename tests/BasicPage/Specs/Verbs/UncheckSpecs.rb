require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Uncheck keyword" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the check box is checked" do
      Check :checkbox
      Should Be Checked :checkbox
    end
    And "the user unchecks the check box" do
      Uncheck :checkbox
    end
      Then "the check box should not be checked" do
        Should Not Be Checked :checkbox
      end
  #-------------------------------------------------------------------------------
    When "the check box is unchecked" do
      Should Not Be Checked :checkbox
    end
    And "the check box is unchecked again" do
      Uncheck :checkbox
    end
      Then "the check box should be not checked" do
        Should Not Be Checked :checkbox
      end
  #-------------------------------------------------------------------------------
end