module Sapphire
  module DSL
    module Browser
      class Browser
        def Close
          sleep(2)
          $browser.Close
        end

        def Switch
          $browser.Switch
        end
      end
    end
  end
end

