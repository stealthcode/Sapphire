$:.unshift File.expand_path("..", __FILE__)

require 'rubygems'
require 'Platform'
require 'yaml'
require 'selenium-webdriver'
require 'delegate'
require 'Forwardable'

require 'sapphire/Observable'
require 'sapphire/Adapters'
require 'sapphire/Testing'
require 'sapphire/Web'
require 'sapphire/DSL'
require 'sapphire/Extensions'
require 'sapphire/CommandLine'
require 'sapphire/Configuration'
require 'sapphire/Data'
require 'sapphire/Virtualization'
require 'sapphire/TeamCity'
require 'sapphire/Observers'

module Sapphire
  module Sapphire
    include DSL
    include DSL::Scenarios
    include DSL::Browser
    include DSL::Configuration
    include DSL::Data
    include DSL::TestPlans
    include DSL::Coverage
    include Configuration
    include DataAbstractions
    include JobAbstractions
    include WebAbstractions
    include Testing
    include Testing::TeamCity
    include Observers
    include UI
  end
end

$driver = Sapphire::WebAbstractions::MetaBrowser.new(nil)

Sapphire.sub_modules.each do |m|
  m.sub_classes.each do |s|
    m.const_get(s).observe() if m.const_get(s).respond_to? :observe
    Sapphire::Observers::ObserverRepository.instance.Add(m.const_get(s).new) if m.const_get(s).respond_to? :IsObserver
  end
end

