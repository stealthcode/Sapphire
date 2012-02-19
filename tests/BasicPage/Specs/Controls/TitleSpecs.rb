require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Title control" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "the title should be 'Sapphire Testing Page'" do
        Should Show :title => "Sapphire Testing Page"
      end
      And "the title should not be anything else" do
        Should Not Show :title => "blah blah blah"
      end
  #-------------------------------------------------------------------------------
end