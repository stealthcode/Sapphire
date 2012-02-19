module Sapphire
  module DSL
    module Browser
      class Popup
        def Close
          $driver.ClosePopup
        end

        def Switch
          $driver.SwitchToPopup
        end
      end
    end
  end
end