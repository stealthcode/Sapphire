require File.expand_path(File.dirname(__FILE__) +'/Observers/Observer.rb', __FILE__)
Dir[File.dirname(__FILE__) + '/Observers/*.rb'].each {|file| require file }