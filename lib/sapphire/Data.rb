require 'win32ole' if Platform::OS == :win32
Dir[File.dirname(__FILE__) + '/DataAbstractions/*.rb'].each {|file| require file }