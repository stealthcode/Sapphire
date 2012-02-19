module Sapphire
  module DSL
    class FieldNotFoundEvaluation

      attr_reader :field

      def initialize(field, page)
        @field = field
        @page = page
      end

      def Evaluate()
          messages = []

          messages << "Cannot find control matching " + @field.to_s + " for page " + @page.to_s

          raise ExpectationException.new(messages)
      end
    end
  end
end