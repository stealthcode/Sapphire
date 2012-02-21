require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Disable keyword with a radio button" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the disable radio button has not been clicked" do
      Should Show BasicPage
    end
      Then "the radio button should be enabled" do
        Should Show :radio3
      end
  #-------------------------------------------------------------------------------
    When "the disable radio but has been clicked" do
      Click :click_me_to_disable_radio!
    end
      Then "the radio button should be disabled" do
        Should Disable :radio3
      end
  #-------------------------------------------------------------------------------
end