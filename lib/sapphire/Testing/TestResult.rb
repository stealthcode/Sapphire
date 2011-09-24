module Sapphire
  module Testing
    class TestResult

      attr_reader :execution_time
      attr_reader :message
      attr_reader :item
      attr_reader :type
      attr_reader :stack
      attr_reader :messages

      def initialize(type, item, message, stack, execution_time)
        @item = item
        @execution_time = execution_time
        @messages = message
        @stack = stack
        @type = type
      end

    end
  end
end