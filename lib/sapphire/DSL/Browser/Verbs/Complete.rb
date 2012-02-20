module Sapphire
  module DSL
    module Browser
      def Complete(page)
        if(page.is_a? Class)
          temp = page.new
          temp.Complete
        else
          page.Complete
        end
      end
    end
  end
end