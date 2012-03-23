require File.expand_path('../../includes', File.dirname(__FILE__))

TestPlan "Sapphire Regression" do

  Virtually do

    Parameter :test_plans_path => File.expand_path(File.dirname(__FILE__), __FILE__)

    Run :file => :test_plans_path + "/Regression.rb"
    Run :file => :test_plans_path + "/Regression.rb"

  end

end