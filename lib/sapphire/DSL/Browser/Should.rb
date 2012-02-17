module Sapphire
  module DSL
    module Browser
      def Should(item)
        results = item.execute()

        if results.is_a? Hash
          value = results[:value]

          if value.is_a? Hash
            sub_value = value[:value]
            puts sub_value.inspect
            sub_value.Evaluate()
            return
          end
          value.Evaluate()

          return
        end

      end
    end
  end
end

