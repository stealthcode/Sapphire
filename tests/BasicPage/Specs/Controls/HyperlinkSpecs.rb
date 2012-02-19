require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Hyperlink control" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
      Then "the link has not been clicked" do
        Should Show :link_clicked => "link not clicked"
      end
      And "the link is visible" do
        Should Show :link_click_me!
      end
  #-------------------------------------------------------------------------------
    When "the user clicks the link" do
      Click :link_click_me!
    end
      Then "the link should have been clicked" do
        Should Show :link_clicked => "link clicked"
      end
  #-------------------------------------------------------------------------------
end