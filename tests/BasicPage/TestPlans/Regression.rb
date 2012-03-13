require File.expand_path('../../includes', File.dirname(__FILE__))

TestPlan "Sapphire Regression" do

  Virtually do

    Parameter :specs_path => File.expand_path(File.dirname(__FILE__) + "/../Specs/", __FILE__)
    Parameter :matrix_plan => File.expand_path(File.dirname(__FILE__) + "/../TestPlans/", __FILE__)

    Run :file => :specs_path + "/BrowserSpecs.rb"

    Start FireFox With ""
    Navigate To BasicPage

    Run :path => :specs_path + "/Controls/"
    Run :path => :specs_path + "/Verbs/"
    Run :path => :specs_path + "/Evaluators/"
    Run :path => :specs_path + "/LanguageFeatures/"

    Create Matrix :test_grid do
      Using :user_first_name => "John",
            :user_last_name => "Doe"
    end

    Create Matrix :test_grid1 do
      Using :user_first_name => "John",
            :user_last_name => "Doe"
    end

    Using Matrix :test_grid do
      Run :file => :specs_path + "/Matrix/MatrixSpecs.rb"
    end

    #todo - /Verbs/MouseOver
    #todo - /Verbs/Switch

    Exit Browser

  end

end