module Sapphire
  module DSL
    module Browser
      class AlertBox
        def Accept
          $browser.AcceptAlert
        end

        def Set(text)
          $browser.SetAlert(text)
        end
      end
    end
  end
end