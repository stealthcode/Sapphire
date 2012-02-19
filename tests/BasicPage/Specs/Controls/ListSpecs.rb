require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the List control" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "it should show the value list" do
        Should Show :value_list
      end
      And "it should contain Value 1" do
        Should Contain :value_list => "Value 1"
      end
      And "it should contain Value 2" do
        Should Contain :value_list => "Value 2"
      end
      And "it should contain Value 3" do
        Should Contain :value_list => "Value 3"
      end
      And "it should contain Value 4" do
        Should Contain :value_list => "Value 4"
      end
      And "it should not contain Value 5" do
        Should Not Contain :value_list => "Value 5"
      end
  #-------------------------------------------------------------------------------
end