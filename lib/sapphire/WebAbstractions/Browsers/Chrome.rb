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
        args = { :type => :chrome }
        @browser = self.Create args
        super @browser
        $driver = MetaBrowser.new(self)
      end
    end


  end
end


