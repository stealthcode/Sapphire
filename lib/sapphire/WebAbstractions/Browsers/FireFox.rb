module Sapphire
  module WebAbstractions
    class FireFoxBrowser
      include RubySeleniumWebDriver

      attr_reader :browser

      def initialize()
        args = { :type => :firefox }
        @browser = self.Create args
        super(@browser)
        $driver = MetaBrowser.new(self)
      end

    end

    def FireFox(url)
      @rootUrl = url
      return FireFoxBrowser.new
    end

  end
end


