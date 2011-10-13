module Sapphire
  module DSL
    module Browser
      def Differ(arg)
        return Differ.new(arg)
      end

      class Differ
        def initialize(arg)
          @arg = arg
        end

        def execute
          return Evaluation.new(true, @arg.Differ) #args[0] is the value that should be the difference
        end
      end
    end
  end
end