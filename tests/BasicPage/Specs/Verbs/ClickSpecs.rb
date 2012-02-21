require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Click keyword" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user clicks the button" do
      Click :click_me!
    end
      Then "the button should have been clicked" do
        Should Show :button_clicked => "button clicked"
      end
  #-------------------------------------------------------------------------------
end