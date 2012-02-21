require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Press keyword" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "the enter label should say enter not pressed" do
        Should Show :enter => "enter not pressed"
      end
  #-------------------------------------------------------------------------------
    When "the enter button is pressed" do
      Click :first_name
      Press Enter
    end
      Then "the enter label should say enter pressed" do
        Should Show :enter => "enter pressed!"
      end
  #-------------------------------------------------------------------------------
end