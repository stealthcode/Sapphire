module Sapphire
  module DSL
    module Browser
      def Switch(browser)
        x = browser.new
        x.Switch
      end
    end
  end
end