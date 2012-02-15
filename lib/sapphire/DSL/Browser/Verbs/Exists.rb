module Sapphire
  module DSL
    module Browser
      def Exists(symbol)
        if($page.Contains symbol)
          begin
            x = $page.Get(symbol).FindWithoutWait
            return x.displayed?
          rescue
            return false
          end
        end
      end
    end
  end
end

