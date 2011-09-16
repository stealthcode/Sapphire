module Sapphire
  module DSL
    module Browser
      def Accept(browser)
        x = browser.new
        x.Accept
      end
    end
  end
end