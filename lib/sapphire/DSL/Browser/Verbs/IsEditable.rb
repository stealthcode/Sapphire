module Sapphire
  module DSL
    module Browser
      def IsEditable(symbol)
        if($page.Contains symbol)
          begin
            return $page.Get(symbol).IsEditable().Evaluate()
          rescue
            return false
          end
        end
      end
    end
  end
end

