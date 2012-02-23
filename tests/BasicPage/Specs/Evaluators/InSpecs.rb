require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the In Keyword" do

  Given "A user is on the page" do
    Reload BasicPage
    Should Show BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user is checking for items in the list" do
      @list = ["Item 1", "Item 2"]
    end
      Then "the values should be in the list" do
        Should Be In :item_list => @list
      end
  #-------------------------------------------------------------------------------
    When "the user is checking for items in the list" do
      @list = ["Item 5", "Item 6"]
    end
      Then "the values should not be in the list" do
        Should Not Be In :item_list => @list
      end
  #-------------------------------------------------------------------------------
    When "the user is checking for items in the list" do
      @list = ["Value 1", "Value 2"]
    end
      Then "the values should be in the list" do
        Should Be In :value_list => @list
      end
  #-------------------------------------------------------------------------------
    When "the user is checking for items in the list" do
      @list = ["Value 5", "Value 6"]
    end
      Then "the values should not be in the list" do
        Should Not Be In :value_list => @list
      end
  #-------------------------------------------------------------------------------
end