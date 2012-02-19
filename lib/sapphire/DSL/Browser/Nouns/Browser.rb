module Sapphire
  module DSL
    module Browser
      class Browser
        def Close
          sleep(2)
          $driver.Close
        end

        def Switch
          $driver.Switch
        end
      end
    end
  end
end

