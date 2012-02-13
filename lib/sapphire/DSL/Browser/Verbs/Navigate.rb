module Sapphire
  module DSL
    module Browser
      def Navigate(page)
        $browser.NavigateTo(page)
      end
    end
  end
end

