require File.expand_path('../../../includes', File.dirname(__FILE__))

Scenario "Testing the TextBox control" do

  Given "A user is on the page" do
    Reload BasicPage
  end
  #-------------------------------------------------------------------------------
    When "the user is on the page" do
      Should Show BasicPage
    end
    And "they type a new note" do
      Set :new_note => "a new note"
      Click :click_me_to_add_note!
    end
      Then "the new note is shown" do
        Should Show :notes => "a new note"
      end
  #-------------------------------------------------------------------------------

end