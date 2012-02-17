module Sapphire
  module WebAbstractions
    def InternetExplorer(url)
      @rootUrl = url
      driver = InternetExplorerBrowser.new
      driver
    end

    class InternetExplorerBrowser
      include RubySeleniumWebDriver

      attr_reader :browser

      def initialize
        @browser = self.Create :ie
        super(@browser)
        $browser = self
      end
    end
  end
end

