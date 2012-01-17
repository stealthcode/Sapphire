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
          if(results.left != results.right)
            messages = []

            messages << "expected: (nil)" if results.left == nil
            messages << "expected: " + results.left.to_s if results.left != nil
            messages << "got: (nil)" if results.right == nil
            messages << "got: " + results.right.to_s if results.right != nil

            raise ExpectationException.new(messages)
          end
          return
        end

        if(results.is_a? ContainsEvaluation)
          if(!results.left.include? results.right)
            messages = []

            messages << "expected to contain: (nil)" if results.left == nil
            messages << "expected to contain: " + results.left.to_s if results.left != nil
            messages << "got: (nil)" if results.right == nil
            messages << "got: " + results.right.to_s if results.right != nil

            raise ExpectationException.new(messages)
          end
          return
        end

        raise "Cannot act upon result " + results.to_s + " for page " + @page.to_s
      end
    end
  end
end

