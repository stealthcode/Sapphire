module Sapphire
  module Testing
    class TestResult

      attr_reader :execution_time
      attr_reader :message
      attr_reader :myId
      attr_reader :item
      attr_reader :type
      attr_reader :stack
      attr_reader :message

      def initialize(type, item, message, stack, execution_time, id)
        @myId = id
        @item = item
        @execution_time = execution_time
        @message = message
        @stack = stack
        @type = type
      end

    end
  end
end