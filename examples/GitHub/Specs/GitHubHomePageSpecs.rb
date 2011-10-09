require File.expand_path('../../includes', File.dirname(__FILE__))

Scenario "On the GitHub Home Page" do

  Background "Open the browser" do
    Start ConfiguredBrowser With "www.google.com"
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
  #-------------------------------------------------------------------------------
  Finally "Close the browser" do
    Exit Browser
  end
end