require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Matrix Feature: " + :description do

  Given "A user is on the page" do
    Reload BasicPage
    Should Show BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user has a matrix defined parameter" do
      Set :first_name => "John"
      raise "Parameter not set!" if !Has Parameter :user_first_name
    end
      Then "the parameter should be used in the comparison" do
        Should Show :first_name => :user_first_name
      end
  #-------------------------------------------------------------------------------

end