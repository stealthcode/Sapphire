module Sapphire
  module DSL
    module Browser
      class Enter
          def Press
            $driver.Type("\n")
          end
      end
    end
  end
end