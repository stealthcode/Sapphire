require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Compare keyword with dates" do

  Given "A user is on the page" do
    Reload BasicPage
    Clear :date_1
    Clear :date_2
  end
  #-------------------------------------------------------------------------------
    When "there are two non symbol dates 1 day apart" do
      @date1 = Date.today
      @date2 = Date.today + 1
    end
      Then "they should differ by 1 day" do
        Compare @date1, @date2 do
          Should Differ Day 1
        end
      end
  #-------------------------------------------------------------------------------
    When "date one is a symbol and date two is not" do
      Set :date_1 => Date.today
      @date2 = Date.today + 2
    end
      Then "they should differ by 2 days" do
        Compare :date_1, @date2 do
          Should Differ Day 2
        end
      end
  #-------------------------------------------------------------------------------
    When "date one is not a symbol and date two is" do
      @date1 = Date.today
      Set :date_2 => Date.today + 3
    end
      Then "they should differ by 3 days" do
        Compare @date1, :date_2 do
          Should Differ Day 3
        end
      end
  #-------------------------------------------------------------------------------
    When "date one is a symbol and date two is too" do
      Set :date_1 => Date.today
      Set :date_2 => Date.today + 4
    end
      Then "they should differ by 4 days" do
        Compare :date_1, :date_2 do
          Should Differ Day 4
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
end