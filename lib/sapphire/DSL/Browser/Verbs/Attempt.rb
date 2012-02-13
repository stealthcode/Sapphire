module Sapphire
  module DSL
    module Browser
      def Attempt(page)
        if(page.is_a? Class)
          temp = page.new
          $page = temp.Attempt
        else
          $page = page.Attempt
        end
      end
    end
  end
end