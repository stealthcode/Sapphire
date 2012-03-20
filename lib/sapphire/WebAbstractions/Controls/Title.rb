module Sapphire
  module WebAbstractions
    class Title < Control

      def Text
        $driver.Browser().title
      end

    end
  end
end

