module Sapphire
  module DSL
    module Browser
      class Popup
        def Close
          $browser.ClosePopup
        end

        def Switch
          $browser.SwitchToPopup
        end
      end
    end
  end
end