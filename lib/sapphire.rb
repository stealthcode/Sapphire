require "rubygems"
require 'yaml'
require 'selenium-webdriver'
require 'delegate'
require 'Forwardable'
require 'win32ole'
require 'win32console'
require 'json'
require 'colorize'

require File.expand_path(File.dirname(__FILE__) +'/sapphire/Strategies/Strategy.rb', __FILE__)
require File.expand_path(File.dirname(__FILE__) +'/sapphire/Testing/Reporter.rb', __FILE__)
Dir[File.dirname(__FILE__) + '/sapphire/Testing/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/sapphire/TeamCity/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/sapphire/Configuration/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/sapphire/WebAbstractions/Controls/Base/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/sapphire/WebAbstractions/Controls/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/sapphire/DataAbstractions/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/sapphire/JobAbstractions/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/sapphire/Strategies/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/sapphire/DSL/Browser/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/sapphire/DSL/Configuration/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/sapphire/DSL/Data/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/sapphire/DSL/Scenarios/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/sapphire/DSL/TestPlans/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/sapphire/UI/*.rb'].each {|file| require file }

module Sapphire
  module Sapphire
    include DSL::Strategies
    include DSL::Scenarios
    include DSL::Browser
    include DSL::Configuration
    include DSL::Data
    include DSL::TestPlans
    include Configuration::AttrMethods
    include Configuration
    include DataAbstractions
    include JobAbstractions
    include WebAbstractions
    include Testing
    include Testing::TeamCity
    include UI
  end
end