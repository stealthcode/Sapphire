require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Remove Keyword" do

  Given "A user is on the page" do
    Reload BasicPage
    Should Show BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user is checking for items in the list" do
      @list = ["Item 1", "Item 2"]
      Should Be In :item_list => @list
    end
    And "the user removes a value from the list" do
      Clear :first_name
      Set   :first_name => "Item 1"
      Remove :first_name => @list
    end
      Then "the values should be in the list" do
        Should Not Be In :item_list => @list
      end
  #-------------------------------------------------------------------------------
end