module Sapphire
  module WebAbstractions
    def Chrome(url)
      ChromeBrowser.new
    end

    class ChromeBrowser
      include RubySeleniumWebDriver

      attr_reader :browser

      def initialize()
        @browser = self.Create :chrome
        super @browser
        $browser = self
      end
    end
  end
end


