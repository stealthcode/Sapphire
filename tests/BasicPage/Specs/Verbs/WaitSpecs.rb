require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the Wait keyword" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user waits 5 seconds" do
      @start = Time.now
      Wait 5
      @finish = Time.now
    end
      Then "5 seconds should have elapsed" do
        Compare @start, @finish do
          Should Differ By Second 5
        end
      end
  #-------------------------------------------------------------------------------
    When "there are two dates" do
      @start = Time.now
      Wait 5
      @finish = Time.now
    end
      Then "they should fail to differ by 99 days" do
        Compare @start, @finish do
          Should Not Differ By Second 99
        end
      end
  #-------------------------------------------------------------------------------
end