Feature :BasicPage do

  Describe "This feature provides coverage for the BasicPage tests"

  Requirement :showing_alert_box, :importance => :low do

    Describe "As a user testing the alert box
              I would like to press a button prompting the alert box
              so that I can see the alert box display"

    Behavior :should_display_alert_box, :type => :positive

  end

  Requirement :clicking_buttons, :importance => :low  do

    Describe "As a user testing the button control
              I would like to press a button
              so that I can see that the button was clicked"

    Behavior :should_display_button_clicked, :type => :positive

  end

end