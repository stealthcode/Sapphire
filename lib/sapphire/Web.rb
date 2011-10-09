Dir[File.dirname(__FILE__) + '/WebAbstractions/Controls/Base/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/WebAbstractions/Controls/*.rb'].each {|file| require file }

require File.expand_path(File.dirname(__FILE__) +'/WebAbstractions/Controls/Browsers/Chrome.rb', File.dirname(__FILE__))
require File.expand_path(File.dirname(__FILE__) +'/WebAbstractions/Controls/Browsers/FireFox.rb', File.dirname(__FILE__))
require File.expand_path(File.dirname(__FILE__) +'/WebAbstractions/Controls/Browsers/InternetExplorer.rb', File.dirname(__FILE__)) if Platform::OS == :win32