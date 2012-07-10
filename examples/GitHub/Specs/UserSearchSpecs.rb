require File.expand_path('../../includes', File.dirname(__FILE__))

Scenario "Searching for MarcusTheBold" do

  Background "Open the browser" do
    Start ConfiguredBrowser With ""
  end

  Given "A user is on GitHub" do
    Navigate To GitHubHomePage
  end
  #-------------------------------------------------------------------------------
    When "the user searches for MarcusTheBold" do
      Set :search => "MarcusTheBold"
      Press Enter
    end
      Then "it should show the results page" do
        Should Show GitHubSearchResults
      end
      And "it should list MarcusTheBold as a user" do
        Should Contain :users => "MarcusTheBold"
      end
      And "it should list Chris Alderson as a user" do
        #this test will fail
        Should Contain :users => "Chris Alderson"
      end
  #-------------------------------------------------------------------------------
  Finally "Close the browser" do
    Exit Browser
  end
end