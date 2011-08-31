module Sapphire
  module DSL
    module Browser
      def Should(item)
        results = item.execute()

        if results.is_a? Hash
          @page = results[:page] if results[:page] != nil
          value = results[:value]
          modifier = results[:modifier]

          if value.is_a? Hash
            @page = value[:page] if value[:page] != nil
            sub_value = value[:value]
            modifier.Evaluate(sub_value)
            return
          end
          modifier.Evaluate(value)

          return
        end

        if(results.is_a? Evaluation)
          results.left.should == results.right
          return
        end

        raise "Cannot act upon result " + results.to_s + " for page " + @page.to_s
      end
    end
  end
end

