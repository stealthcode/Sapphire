require File.expand_path('../../includes', File.dirname(__FILE__))

TestPlan "Sapphire Regression" do

  Virtually do

    Parameter :path => File.expand_path(File.dirname(__FILE__) + "/../Specs/", __FILE__)

    Run :file => :path + "/BrowserSpecs.rb"

    Start FireFox With ""
    Navigate To BasicPage

    Run :file => :path + "/Controls/LabelSpecs.rb"
    Run :file => :path + "/Controls/TextBoxSpecs.rb"
    Run :file => :path + "/Controls/ListSpecs.rb"
    #Run :file => :path + "/SetSpecs.rb"
    #Run :file => :path + "/ShowSpecs.rb"
    #Run :file => :path + "/NotShowSpecs.rb"

    Exit Browser
  end

end