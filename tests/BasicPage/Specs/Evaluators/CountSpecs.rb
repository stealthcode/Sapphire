require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Count Keyword" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "it should have 4 values in the list" do
        Should Have Count :value_list => 4
      end
      And "it should not have 5 values in the list" do
        Should Not Have Count :value_list => 5
      end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "it should have 4 values in the list" do
        Should Have Count :item_list => 4
      end
      And "it should not have 5 values in the list" do
        Should Not Have Count :item_list => 5
      end
  #-------------------------------------------------------------------------------
end