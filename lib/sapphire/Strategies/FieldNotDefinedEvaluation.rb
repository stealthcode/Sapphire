module Sapphire
  module DSL
    module Strategies
      class FieldNotDefinedEvaluation

        attr_reader :field

        def initialize(field, page)
          @field = field
          @page = page
        end

        def Evaluate()
            messages = []

            messages << "Cannot find control " + @field.to_s + " defined for page " + @page.to_s

            raise ExpectationException.new(messages)
        end
      end
    end
  end
end