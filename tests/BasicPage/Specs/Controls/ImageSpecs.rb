require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Image control" do

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
      And "the source should be Google" do
        Should Have Source :image => "https://ssl.gstatic.com/s2/oz/images/google-logo-plus-0fbe8f0119f4a902429a5991af5db563.png"
      end
      And "the alt text should be hi" do
        Should Have AltText :image => "hi"
      end
      And "the source should be not be yahoo" do
        Should Not Have Source :image => "https://ssl.yahoo.com/s2/oz/images/google-logo-plus-0fbe8f0119f4a902429a5991af5db563.png"
      end
      And "the alt text should not be hello" do
        Should Not Have AltText :image => "hello"
      end
  #-------------------------------------------------------------------------------
end