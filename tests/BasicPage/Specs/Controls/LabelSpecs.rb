require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Label control" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "it should show the welcome h1" do
        Should Show :welcome
      end
      And "the value should be welcome" do
        Should Show :welcome => "Welcome"
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
      end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "it should not show the wrong welcome h1 value" do
        Should Not Show :welcome => "Welcome1"
      end
  #-------------------------------------------------------------------------------
end