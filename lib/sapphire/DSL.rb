Dir[File.dirname(__FILE__) + '/DSL/Browser/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/DSL/Browser/Keys/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/DSL/Configuration/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/DSL/Data/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/DSL/Scenarios/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/DSL/TestPlans/*.rb'].each {|file| require file }
