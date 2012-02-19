module Sapphire
  module DSL
    module Browser
      class AlertBox
        def Accept
          $driver.AcceptAlert
        end

        def Set(text)
          $driver.SetAlert(text)
        end
      end
    end
  end
end