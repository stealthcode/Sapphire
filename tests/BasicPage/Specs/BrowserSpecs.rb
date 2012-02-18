require File.expand_path('../../includes', File.dirname(__FILE__))

Scenario "Testing the basic browser commands" do

  Background "the user has opened their browser" do
    Start FireFox With BasicPage
  end
  Given "a user navigates to the Basic Page" do
    Navigate To BasicPage
    Should Show BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user reloads the page" do
      Reload BasicPage
    end
      Then "it should show the same page" do
        Should Show BasicPage
      end
  #-------------------------------------------------------------------------------
  Finally "the browser should be able to be closed" do
    Exit Browser
  end
end