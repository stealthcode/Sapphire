require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Button control" do

  Covers :feature => :clicking_buttons

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "the button has not been clicked" do
        Should Show :button_clicked => "button not clicked"
      end
      And "the button is visible" do
        Should Show :click_me!
      end
  #-------------------------------------------------------------------------------
    When "the user clicks the button" do
      Click :click_me!
    end
      Then "the button should have been clicked" do
        Covers :behavior => :should_display_button_clicked

        Should Show :button_clicked => "button clicked"
      end
  #-------------------------------------------------------------------------------
end