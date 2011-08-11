require File.expand_path('../../includes', File.dirname(__FILE__))

Scenario "At github.com/amirrajan" do

  Background "A user is at github.com/amirrajan" do
    Start ConfiguredBrowser With GitHubAmirUrl
  end

  Given "A user is on the score cast page" do
    Navigate To GitHubAmir
  end
  #-------------------------------------------------------------------------------
    When "at Amir github Account" do
      #already here from the Given
    end
    Then "the first project is rake-dot-net" do
      Should Show :first_project => "rake-dot-net"
      end
    And "the second project is Oak" do
      Should Show :second_project => "Oak"
      end
    And "the third project is Html5-Force-Directed-Graph" do
      Should Show :third_project => "Html5-Force-Directed-Graph"
      end
    And "the fourth project is Restful-Silverlight" do
      Should Show :fourth_project => "Restful-Silverlight"
      end
    And "the first project is SpecWatchr" do
      Should Show :fifth_project => "SpecWatchr"
    end
  #-------------------------------------------------------------------------------
  Finally "Close the browser" do
    Exit Browser
  end
end