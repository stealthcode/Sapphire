module Sapphire
  module DSL
    module Browser
      class Enter
          def Press
            $browser.Type("\n")
          end
      end
    end
  end
end