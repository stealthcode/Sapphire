Dir[File.dirname(__FILE__) + '/WebAbstractions/Controls/Base/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/WebAbstractions/Controls/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/WebAbstractions/Browsers/*.rb'].each {|file| require file }