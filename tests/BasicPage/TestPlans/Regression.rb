require File.expand_path('../../includes', File.dirname(__FILE__))

TestPlan "Sapphire Regression" do

  Parameter :path => File.expand_path(File.dirname(__FILE__) + "/../Specs/", __FILE__)

  Run :file => :path + "/BrowserSpecs.rb"
  Run :file => :path + "/SetSpecs.rb"
  Run :file => :path + "/ShowSpecs.rb"
  Run :file => :path + "/NotShowSpecs.rb"

end