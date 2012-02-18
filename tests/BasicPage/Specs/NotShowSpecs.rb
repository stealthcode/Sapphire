require File.expand_path('../../includes', File.dirname(__FILE__))

Scenario "Testing the 'Not Show' Keyword" do

  Background "Open the browser" do
    Start FireFox With BasicPage
    Navigate To BasicPage
  end
  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "then the user should not be on the incorrect page" do
        Should Not Show IncorrectPage
      end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "the bogus field should not be visible" do
        Should Not Show :bogus_field
      end
      And "the first name should not be John1" do
        Should Not Show :first_name => "John1"
      end
  #-------------------------------------------------------------------------------
  Finally "Close the browser" do
    Exit Browser
  end
end