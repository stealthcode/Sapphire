require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing controls with multiple lookup definitions" do

  Given "A user is on the page" do
    Navigate To BasicPage
  end
  #-------------------------------------------------------------------------------
  When "the user is on the page" do
    Should Show BasicPage
  end
    Then "it should show the welcome h1" do
      Should Show :welcome
    end
    And "the value should be welcome" do
      Should Show :credit_score_multi => "600"
    end
  #------------------------------------------------------------------------------
end