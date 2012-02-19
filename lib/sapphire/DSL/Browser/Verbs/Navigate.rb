module Sapphire
  module DSL
    module Browser
      def Navigate(page)
        $driver.NavigateTo(page)
      end
    end
  end
end

