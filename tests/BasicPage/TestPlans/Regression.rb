require File.expand_path('../../includes', File.dirname(__FILE__))

TestPlan "Sapphire Regression" do

  Virtually do

    Parameter :specs_path => File.expand_path(File.dirname(__FILE__) + "/../Specs/", __FILE__)

    Run :file => :specs_path + "/BrowserSpecs.rb"

    Start FireFox With ""
    Navigate To BasicPage

    Run :path => :specs_path + "/Controls/"
    Run :path => :specs_path + "/Verbs/"
    Run :path => :specs_path + "/Evaluators/"

    #Run :file => :specs_path + "/Evaluators/CountSpecs.rb"

    #todo - /Controls/Image
    #todo - /Verbs/Has
    #todo - /Verbs/MouseOver
    #todo - /Verbs/Remove
    #todo - /Verbs/Switch
    #todo - /Evaluators/Error
    #todo - /Evaluators/Exist
    #todo - /Evaluators/In
    #todo - /Evaluators/Selected
    #todo - /Evaluators/Show
    #todo - /Evaluators/Transition
    #todo - /Evaluators/Validate

    Exit Browser

  end

end