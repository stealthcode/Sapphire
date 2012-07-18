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
        Should Show :first_name => "John1"
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
    When "a box is readonly" do
      Should Show :read_only => "Jane Doe"
    end
    And "we try to set it" do
      Set :read_only => "new value"
    end
      Then "it does not set" do
        Should Show :read_only => "Jane Doe"
      end
  #-------------------------------------------------------------------------------
end