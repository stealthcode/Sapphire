require File.expand_path('../../includes', File.dirname(__FILE__))

Scenario "Testing the 'Set' Keyword" do

  Background "Open the browser" do
    Start FireFox With BasicPage
    Navigate To BasicPage
  end
  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
  When "first name is cleared" do
    Set :first_name => ""
  end
  And "first name is set to Jane" do
    Set :first_name => "Jane"
  end
    Then "John should be in the first name box" do
      Should Show :first_name => "Jane"
    end
  #-------------------------------------------------------------------------------
  Finally "Close the browser" do
    Exit Browser
  end
end