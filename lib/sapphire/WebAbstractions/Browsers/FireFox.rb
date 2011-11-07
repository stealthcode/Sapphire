module Sapphire
  module WebAbstractions
    class FireFoxBrowser
      include RubySeleniumWebDriver

      attr_reader :browser

      def initialize()
        @browser = self.Create :firefox
        super(@browser)
        $browser = self
      end

    end

    def FireFox(url)
      FireFoxBrowser.new
    end
  end
end


