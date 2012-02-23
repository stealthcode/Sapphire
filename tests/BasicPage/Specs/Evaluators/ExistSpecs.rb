require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Validate Keyword" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user is comparing two equal values" do
      Should Show BasicPage
    end
      Then "the values should be equal" do
        @value = 123
        Should Exist @value
      end
  #-------------------------------------------------------------------------------
    When "the user is comparing two non-equal values" do
      Should Show BasicPage
    end
      Then "the values should not be equal" do
        @value = nil
        Should Not Exist @value
      end
  #-------------------------------------------------------------------------------
end