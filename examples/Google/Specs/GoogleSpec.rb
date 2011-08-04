require File.expand_path('../../includes', File.dirname(__FILE__))

Scenario "At google.com" do

  Background "A user is at www.google.com" do
    Start ConfiguredBrowser With GoogleUrl
  end

  Given "A user is on the score cast page" do
    Navigate To Google
  end
  #-------------------------------------------------------------------------------
    When "the user search for cake" do
      Set :search_box => "cake"
      sleep(1)
      Click :search
    end
    Then "it should show the results" do
      Should Show GoogleResults
    end
  #-------------------------------------------------------------------------------
    When "the user clicks images" do
      Click :images
    end
    Then "it should show the image search page" do
      Should Show GoogleImages
    end
  #-------------------------------------------------------------------------------
  Finally "Close the browser" do
    Exit Browser
  end
end