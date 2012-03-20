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

    Create Matrix :test_grid do
      Using :description => "Test 1",
            :user_first_name => "John",
            :user_last_name => "Doe"
      Using :description => "Test 2",
            :user_first_name => "John222",
            :user_last_name => "Doe"
    end

    Using Matrix :test_grid do
      Run :file => :specs_path + "/Matrix/MatrixSpecs.rb"
    end

    Run :path => :specs_path + "/LanguageFeatures/"
    #todo - /Verbs/MouseOver
    #todo - /Verbs/Switch

    Exit Browser

  end

end