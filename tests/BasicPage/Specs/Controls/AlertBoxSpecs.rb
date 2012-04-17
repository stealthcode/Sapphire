require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the AlertBox control" do

  Covers :requirement => :showing_alert_box

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "the alert box is not showing" do
        Should Not Show :alert
      end
  #-------------------------------------------------------------------------------
    When "the user clicks the alert link" do
      Click :alert_me
    end
      Then "the button should have been clicked" do
        Covers :behavior => :should_display_alert_box
        Should Show :alert
      end
      And "it should say 'test!'" do
        Should Show :alert => "test!"
        Accept :alert
      end
  #-------------------------------------------------------------------------------
end