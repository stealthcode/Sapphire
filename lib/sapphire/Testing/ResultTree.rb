module Sapphire
  module Testing
    class ResultTree

      attr_accessor :results
      attr_accessor :type
      attr_accessor :text
      attr_accessor :messages
      attr_accessor :stack
      attr_accessor :time
      attr_accessor :parent
      attr_accessor :item

      def initialize(text, result)

        @type = 'pass'
        @time = 0

        if(result != nil)
          self.type = result.type
          @iconCls = "accept" if result.type == "pass"
          @iconCls = "delete" if result.type == "fail"
          @iconCls = "error" if result.type == "pending"
          @time = result.execution_time
          @expanded = true
          @messages = result.messages
          @stack = result.stack
        end
        @text = text
        @results = []
        @leaf = true

      end

      def AddChild(node)
        node.parent = self
        @results << node
        @leaf = false
      end

    end
  end
end

