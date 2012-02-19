module Sapphire
  module WebAbstractions
    class Title < Control

      def Text
        $driver.browser.title
      end

    end
  end
end

