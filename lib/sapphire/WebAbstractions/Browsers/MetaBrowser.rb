module Sapphire
  module WebAbstractions

    class MetaBrowser
      include RubySeleniumWebDriver

      attr_reader :driver

      def initialize(driver)
        @driver = driver
      end

      def Browser()
        raise "Browser is null. Did you forget to start the browser?" if self.driver.nil? or self.driver.browser.nil?
        self.driver.browser
      end

    end
  end
end


