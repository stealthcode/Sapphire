require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Checked Keyword" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "the check box is visible" do
        Should Show :checkbox
      end
      And "the check box should not be checked" do
        Should Not Be Checked :checkbox
      end
  #-------------------------------------------------------------------------------
    When "the user checks the check box" do
      Check :checkbox
    end
      Then "the check box should be checked" do
        Should Be Checked :checkbox
      end
  #-------------------------------------------------------------------------------
end