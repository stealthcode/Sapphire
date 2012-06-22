require File.expand_path(File.dirname(__FILE__) +'/Plugins/Plugin.rb', __FILE__)
Dir[File.dirname(__FILE__) + '/Plugins/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/Plugins/FireBug/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/Plugins/Browser/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/Plugins/Debugging/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/Plugins/Highlighters/*.rb'].each {|file| require file }