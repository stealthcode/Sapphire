require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the On keyword" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "the Google Home Page should not be shown" do
        Should Not Show GoogleHomePage if On BasicPage
      end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "the basic page should be shown" do
        Should Show BasicPage if On BasicPage
      end
  #-------------------------------------------------------------------------------
end