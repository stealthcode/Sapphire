require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the TextBox control" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "the first name is set to John" do
        Should Show :first_name => "John"
      end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "the first name is not set to Jane" do
        Should Not Show :first_name => "Jane"
      end
  #-------------------------------------------------------------------------------
    When "first name is cleared" do
      Clear :first_name
    end
    And "first name is set to Jane" do
      Set :first_name => "Jane"
    end
      Then "Jane should be in the first name box" do
        Should Show :first_name => "Jane"
      end
  #-------------------------------------------------------------------------------
end