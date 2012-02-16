module Sapphire
  module DSL
    module Browser
      def Should(item)
        results = item.execute()

        if results.is_a? Hash
          value = results[:value]
          modifier = results[:modifier]

          if value.is_a? Hash
            sub_value = value[:value]
            modifier.Evaluate(sub_value)
            return
          end
          modifier.Evaluate(value)

          return
        end

      end
    end
  end
end

