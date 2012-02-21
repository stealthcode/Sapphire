require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Accept keyword" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user clicks the alert link" do
      Click :alert_me
      Should Show :alert
    end
    And "the user clicks 'Ok' on the alert" do
      Accept :alert
    end
      Then "the should not be visible" do
        Should Not Show :alert
      end
  #-------------------------------------------------------------------------------
end