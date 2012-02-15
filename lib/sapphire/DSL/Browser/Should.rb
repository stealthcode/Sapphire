module Sapphire
  module DSL
    module Browser
      def Should(item)
        results = item.execute()

        if results.is_a? Hash
          $page = results[:page] if results[:page] != nil
          value = results[:value]
          modifier = results[:modifier]

          if value.is_a? Hash
            $page = value[:page] if value[:page] != nil
            sub_value = value[:value]
            modifier.Evaluate(sub_value)
            return
          end
          modifier.Evaluate(value)

          return
        end

        results.Evaluate()
      end
    end
  end
end

