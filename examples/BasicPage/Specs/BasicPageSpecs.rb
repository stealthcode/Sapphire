require File.expand_path('../../includes', File.dirname(__FILE__))

Scenario "On the GitHub Home Page" do

  Background "Open the browser" do
    Start FireFox With BasicPage
    Navigate To BasicPage
  end

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Not Show IncorrectPage
      Should Show BasicPage
    end
    Then "it should show the welcome h1" do
      Should Show :welcome => "Welcome"
    end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do

    end
    Then "the last name text box should be visible" do
      Should Show :last_name
    end
    And "John should be in the first name box" do
      Should Show :first_name => "John"
    end
    And "Doe in the last name box" do
      Should Show :last_name => "Doe"
    end
    And "Should not show a bogus field" do
      Should Not Show :bogus_field
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
    And "Doe in the last name box" do
      Should Show :last_name => "Doe"
      Should Not Show :last_name => "Doe1"
    end
  #-------------------------------------------------------------------------------
    When "an ajax call is being made" do
      Should Show :ajax => "ajax not loaded"
    end
    Then "the call returns" do
      Should Show :ajax => "ajax loaded"
    end
  #-------------------------------------------------------------------------------
    When "a slow ajax call is being made" do
      Should Show :slow_ajax => "slow ajax not loaded"
    end
    Then "the call fails to return in time" do
      Should Show :slow_ajax => "slow ajax not loaded"
      Should Not Show :slow_ajax => "slow ajax loaded"
    end
  #-------------------------------------------------------------------------------
  Finally "Close the browser" do
    Exit Browser
  end
end