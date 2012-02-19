module Sapphire
  module DSL
    module Browser
      def Reload(item)
        $driver.Reload
        Should Show item
      end
    end
  end
end

