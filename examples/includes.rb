require File.expand_path('../../lib/sapphire', __FILE__)

include Sapphire::Sapphire

Dir[File.dirname(__FILE__) + '/GitHub/Pages/*.rb'].each {|file| require file }

if(!$config)
   file = File.expand_path('../config.yaml', __FILE__)
   yaml = YAML::load(File.open(file))
   env =  ENV[":env"] || "local"
   $config = yaml[env.to_s]
   AppConfig.create $config
end
