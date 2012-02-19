require File.expand_path(File.dirname(__FILE__) +'/DSL/Evaluators/Evaluator.rb', __FILE__)
require File.expand_path(File.dirname(__FILE__) +'/DSL/Comparisons/Comparison.rb', __FILE__)
Dir[File.dirname(__FILE__) + '/DSL/Evaluators/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/DSL/Comparisons/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/DSL/Evaluations/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/DSL/TestPlans/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/DSL/Browser/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/DSL/Browser/Fluff/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/DSL/Browser/Nouns/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/DSL/Browser/Verbs/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/DSL/Browser/Keys/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/DSL/Configuration/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/DSL/Data/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/DSL/Scenarios/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/DSL/Events/*.rb'].each {|file| require file }
