require File.expand_path('../../lib/sapphire', __FILE__)

include Sapphire::Sapphire

Dir[File.dirname(__FILE__) + '/BasicPage/Features/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/BasicPage/Pages/*.rb'].each {|file| require file }

