require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Show keyword" do

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
      And "the bogus field should not be shown" do
        Should Not Show :bogus_field
      end
      And "the first name should be John" do
        Should Show :first_name => "John"
      end
      And "the first name should not be Jane" do
        Should Not Show :first_name => "Jane"
      end
      And "the page should not be the incorrect page" do
        Should Not Show IncorrectPage
      end
  #-------------------------------------------------------------------------------
end