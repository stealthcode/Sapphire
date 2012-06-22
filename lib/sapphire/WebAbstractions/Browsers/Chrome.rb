module Sapphire
  module WebAbstractions
    def Chrome(url)
      @rootUrl = url
      ChromeBrowser.new
    end

    class ChromeBrowser
      include RubySeleniumWebDriver

      attr_reader :browser

      def initialize()
        @browser = self.Create :chrome
        super @browser
        $driver = MetaBrowser.new(self)
      end
    end


  end
end


