module Sapphire
  module DSL
    class FieldNotDefinedEvaluation

      attr_reader :field

      def initialize(field, page)
        @field = field
        @page = page
      end

      def Output()
          messages = []

          messages << "Cannot find control " + @field.to_s + " defined for page " + @page.to_s

          raise ExpectationException.new(messages)
      end
    end
  end
end