module Sapphire
  module DSL
    module Browser
      def Complete(page)
        if(page.is_a? Class)
          temp = page.new
          $page = temp.Complete
        else
          $page = page.Complete
        end
      end
    end
  end
end