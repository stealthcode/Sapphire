require File.expand_path('../../lib/sapphire', __FILE__)

include Sapphire::Sapphire

Dir[File.dirname(__FILE__) + '/GitHub/Pages/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/BasicPage/Pages/*.rb'].each {|file| require file }

if(!$config)
  file = File.expand_path('../config.yaml', __FILE__)
  yaml = YAML::load(File.open(file))

  $config = yaml[ENV["env"].to_s]
  $config = yaml["local"] if $config.nil?

  AppConfig.create $config
end