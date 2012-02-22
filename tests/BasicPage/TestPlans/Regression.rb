require File.expand_path('../../includes', File.dirname(__FILE__))

TestPlan "Sapphire Regression" do

  Virtually do

    Parameter :path => File.expand_path(File.dirname(__FILE__) + "/../Specs/", __FILE__)

    Run :file => :path + "/BrowserSpecs.rb"

    Start FireFox With ""
    Navigate To BasicPage

    Run :file => :path + "/Controls/AlertBoxSpecs.rb"
    Run :file => :path + "/Controls/ButtonSpecs.rb"
    Run :file => :path + "/Controls/CheckBoxSpecs.rb"
    Run :file => :path + "/Controls/DropDownSpecs.rb"
    Run :file => :path + "/Controls/HyperlinkSpecs.rb"
    #todo - Image
    Run :file => :path + "/Controls/LabelSpecs.rb"
    Run :file => :path + "/Controls/ListSpecs.rb"
    Run :file => :path + "/Controls/RadioButtonSpecs.rb"
    Run :file => :path + "/Controls/TextBoxSpecs.rb"
    Run :file => :path + "/Controls/TitleSpecs.rb"

    Run :file => :path + "/Verbs/AcceptSpecs.rb"
    Run :file => :path + "/Verbs/CheckSpecs.rb"
    Run :file => :path + "/Verbs/ClearSpecs.rb"
    Run :file => :path + "/Verbs/ClickSpecs.rb"
    Run :file => :path + "/Verbs/CompareSpecs.rb"
    Run :file => :path + "/Verbs/CompleteSpecs.rb"
    #Run :file => :path + "/Verbs/DisableSpecs.rb"
    Run :file => :path + "/Verbs/ExistsSpecs.rb"
    #todo - Has
    #todo - MouseOver
    Run :file => :path + "/Verbs/NavigateSpecs.rb"
    Run :file => :path + "/Verbs/OnSpecs.rb"
    Run :file => :path + "/Verbs/PressSpecs.rb"
    #todo - Remove
    Run :file => :path + "/Verbs/SetSpecs.rb"
    #todo - Switch
    Run :file => :path + "/Verbs/UncheckSpecs.rb"
    Run :file => :path + "/Verbs/WaitSpecs.rb"

    Run :file => :path + "/Evaluators/CheckedSpecs.rb"
    #Run :file => :path + "/Evaluators/ContainSpecs.rb"
    #todo - Count
    Run :file => :path + "/Evaluators/DifferSpecs.rb"
    #todo - Error
    #todo - Exist
    #todo - In
    #todo - Selected
    #todo - Show
    #todo - Transition
    #todo - Validate

    Exit Browser

  end

end