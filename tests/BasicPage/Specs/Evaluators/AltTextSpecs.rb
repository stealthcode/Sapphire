require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the AltText keyword" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "the image should be present" do
        Should Show :image
      end
      And "the alt text should be hi" do
        Should Have AltText :image => "hi"
      end
      And "the alt text should not be hello" do
        Should Not Have AltText :image => "hello"
      end
  #-------------------------------------------------------------------------------
end