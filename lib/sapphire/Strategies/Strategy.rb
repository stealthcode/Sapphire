module Sapphire
  module DSL
    module Strategies
      class Strategy
        def initialize(page, browser)
          @page = page
          @browser = browser
        end
      end
    end
  end
end
