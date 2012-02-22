require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Selected keyword" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "neither radio button should be selected" do
        Should Not Be Selected :radio1
        Should Not Be Selected :radio2
      end
  #-------------------------------------------------------------------------------
    When "the user selects Radio 1" do
      Click :radio1
    end
      Then "radio 1 should be selected" do
        Should Be Selected :radio1
      end
      And "radio 2 should not be selected" do
        Should Not Be Selected :radio2
      end
  #-------------------------------------------------------------------------------
end