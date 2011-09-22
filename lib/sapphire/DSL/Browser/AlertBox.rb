module Sapphire
  module DSL
    module Browser
      class AlertBox
        def Accept
          alert = $browser.switch_to.alert
          alert.accept()
          $browser.switch_to.window($browser.window_handles[0])
        end

        def Set(text)
          alert = $browser.switch_to.alert
          alert.send_keys(text)
          alert.accept()
          $browser.switch_to.window($browser.window_handles[0])
        end
      end
    end
  end
end