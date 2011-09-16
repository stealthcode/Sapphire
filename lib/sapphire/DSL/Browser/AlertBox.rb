module Sapphire
  module DSL
    module Browser
      class Browser
        def Close
          sleep(2)
          $browser.close
        end

        def Switch
          $browser.switch_to.window($browser.window_handles[0])
        end
      end
    end
  end
end

