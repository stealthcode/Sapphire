module Sapphire
  module Testing
    class ExpectationException < StandardError
      attr_reader :messages

      def initialize(messages)
        @messages = messages
      end
    end
  end
end
