require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Compare keyword with dates" do

  Given "A user is on the page" do
    Reload BasicPage
    Clear :date_1
    Clear :date_2
  end
  #-------------------------------------------------------------------------------
    When "there are two dates 1 day apart" do
      @date1 = Date.today
      @date2 = Date.today + 1
    end
      Then "they should differ by 1 day" do
        Compare @date1, @date2 do
          Should Differ Day 1
        end
      end
  #-------------------------------------------------------------------------------
    When "there are two dates 1 month apart" do
      @date1 = Date.today
      @date2 = Date.today >> 1
    end
      Then "they should differ by 1 month" do
        Compare @date1, @date2 do
          Should Differ Month 1
        end
      end
  #-------------------------------------------------------------------------------
    When "there are two dates" do
      @date1 = Date.today
      @date2 = Date.today + 4
    end
      Then "they should fail to differ by 99 days" do
        Compare @date1, @date2 do
          Should Not Differ Day 99
        end
      end
  #-------------------------------------------------------------------------------
    When "there are two dates" do
      @date1 = Date.today
      @date2 = Date.today >> 4
    end
      Then "they should fail to differ by 99 months" do
        Compare @date1, @date2 do
          Should Not Differ Month 99
        end
      end
  #-------------------------------------------------------------------------------
end