require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Transition keyword" do

  Given "A user is on the page" do
    Navigate To BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user navigates to the google home page" do
      Navigate To GoogleHomePage
    end
      Then "the google home page should be shown" do
        Should Transition To "http://www.google.com"
      end
  #-------------------------------------------------------------------------------
    When "the user does not navigate to the google home page" do
      Should Show BasicPage
    end
      Then "the google home page should not be shown" do
        Should Not Transition To "http://www.google.com"
      end
  #-------------------------------------------------------------------------------
end