require File.expand_path(File.dirname(__FILE__) +'/UI/ProcessBuilder.rb', File.dirname(__FILE__)) if Platform::OS == :win32
require File.expand_path(File.dirname(__FILE__) +'/UI/VirtualUI.rb', File.dirname(__FILE__)) if Platform::OS == :win32

module Sapphire
  module UI

  end
end