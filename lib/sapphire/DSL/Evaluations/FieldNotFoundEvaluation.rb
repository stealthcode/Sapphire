module Sapphire
  module DSL
    class FieldNotFoundEvaluation

      attr_reader :field

      def initialize(field, page, message)
        @field = field
        @page = page
        @message = message
      end

      def Output()
          messages = []

          messages << "Cannot find control matching " + @field.to_s + " for page " + @page.to_s
          messages << "Reason: " + @message

          raise ExpectationException.new(messages)
      end
    end
  end
end