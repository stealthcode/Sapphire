require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Parameters Feature" do

  Given "A user is on the page" do
    Reload BasicPage
    Should Show BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user goes to compare two page values" do
      Set :first_name => "John"
      Set :last_name => "John"
    end
      Then "the two page values should be the same" do
        Should Show :first_name => :last_name
      end
      And "the reverse comparison should also be true" do
        Should Show :last_name => :first_name
      end
  #-------------------------------------------------------------------------------
    When "the user defines a parameter" do
      Parameter :user_first_name => "John"
    end
      Then "the parameter should be able to be used for comparisons as a right operand" do
        Should Show :first_name => :user_first_name
      end
  #-------------------------------------------------------------------------------
    When "the user defines a parameter" do
      Parameter :user_first_name => "John"
    end
      Then "the parameter should be able to be 'shown'" do
        Should Show :user_first_name => "John"
      end
  #-------------------------------------------------------------------------------
    When "the user defines a parameter" do
      Parameter :user_first_name => "John"
    end
      Then "the parameter should be able to be used for comparisons as a left operand" do
         Should Show :user_first_name => :first_name
      end
  #-------------------------------------------------------------------------------
    When "the user defines a parameter" do
      Parameter :user_first_name => "John1"
    end
      Then "the parameter should be not equal if the values are not equal" do
         Should Not Show :user_first_name => :first_name
      end
  #-------------------------------------------------------------------------------
    When "the user defines a parameter with the same name as a page variable" do
      Parameter :first_name => "John1"
    end
      Then "the page variable should take precedence" do
        Should Show :first_name => "John"
      end
  #-------------------------------------------------------------------------------

end