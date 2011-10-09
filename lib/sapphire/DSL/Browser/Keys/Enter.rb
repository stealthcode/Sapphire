module Sapphire
  module DSL
    module Browser
      class Enter
          def Press
            $browser.action.send_keys("\n").perform()
          end
      end
    end
  end
end