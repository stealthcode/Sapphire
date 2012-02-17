require File.expand_path(File.dirname(__FILE__) +'/Strategies/Modifier.rb', __FILE__)
Dir[File.dirname(__FILE__) + '/Strategies/*.rb'].each {|file| require file }