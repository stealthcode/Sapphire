module Sapphire
  module DSL
    module Browser
      def Start(browser)
        if(browser == ConfigurationBrowser)
          AppConfig.Current.Browser
        end

        $browser.SetRootUrl(@rootUrl)
      end
    end
  end
end

