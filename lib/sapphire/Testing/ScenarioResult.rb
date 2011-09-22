module Sapphire
  module Testing
    class ScenarioResult

      attr_reader :results
      attr_accessor :myId
      attr_reader :type
      attr_reader :time
      attr_reader :parent

      def initialize(text)
        @text = text
        @results = []
        @leaf = true
        @myId = -1
        @type = 'pass'
        @time = 0
      end

      def AddChild(result)
        result.parent = self
        @results << result
        @time += result.time
      end

      def set_id(id)
        @myId = id
      end

      def set_type(type)
        @type = type
      end

    end
  end
end
