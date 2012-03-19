module Sapphire
  module Testing
    class TestPlanResult

      attr_reader :execution_time
      attr_reader :message
      attr_reader :item
      attr_reader :type
      attr_reader :stack
      attr_reader :messages
      attr_reader :text

      def initialize(type, item, message, stack, execution_time)
        @item = item
        @text = "Failure running commands in TestPlan: " + item.text
        @execution_time = execution_time
        @messages = message
        @stack = stack
        @type = type
      end

    end
  end
end