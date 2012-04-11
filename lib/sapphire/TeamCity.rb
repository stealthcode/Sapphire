module Sapphire
  module Testing
    module TeamCity
      class TeamCityReporter < Reporter

      end
    end
  end
end

Dir[File.dirname(__FILE__) + '/TeamCity/*.rb'].each {|file| require file } if ENV["TeamCity"] == "1"