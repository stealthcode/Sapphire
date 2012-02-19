module Sapphire
  module DSL
    module Browser
      def Start(browser)
        if(browser == ConfigurationBrowser)
          return AppConfig.Current.Browser if AppConfig.Current
          raise "No App Config defined!"
        end
        $driver.SetRootUrl(@rootUrl)
      end
    end
  end
end

