Dir[File.dirname(__FILE__) + '/TeamCity/*.rb'].each {|file| require file } if ENV["TeamCity"] == "1"

module Sapphire
  module Testing
    module TeamCity

    end
  end
end