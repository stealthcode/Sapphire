require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Has keyword" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user has defined a parameter" do
      Parameter :test => "test"
    end
      Then "the has keyword should find the parameter" do
        Should Not Show :first_name if !Has Parameter :test
      end
  #-------------------------------------------------------------------------------
    When "the user has not defined a parameter" do
      Should Show BasicPage
    end
      Then "the has keyword should find the parameter" do
        Should Show :bogus_field if Has Parameter :non_existant_parameter
      end
  #-------------------------------------------------------------------------------
end