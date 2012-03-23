require File.expand_path('../../includes', File.dirname(__FILE__))

require 'rubygems'
require 'sapphire'
include Sapphire::Sapphire

def Report(&block)
  $instances.each do |reporter|
    block.call reporter
  end
end

if $instances.empty?
  $instances << ConsoleReporter.new()
end

Report do |x| x.BeginTesting end

load File.expand_path(File.dirname(__FILE__)) + "/Regression.rb"
load File.expand_path(File.dirname(__FILE__)) + "/Regression.rb"

Report do |x| x.TestingComplete end
Report do |x| x.OutputResults end
