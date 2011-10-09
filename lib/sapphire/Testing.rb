require File.expand_path(File.dirname(__FILE__) +'/Testing/Reporter.rb', __FILE__)
Dir[File.dirname(__FILE__) + '/Testing/*.rb'].each {|file| require file }
