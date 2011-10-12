module Sapphire
  module DSL
    module Browser
      def Differ(args)
        return Differ.new(args)
      end

      class Differ
        def initialize(args)
          @args = args
        end

        def execute
          difference = (@args[1] - @args[2]).to_i #args[1] is the value from the first control, #args[2] the second control
          return Evaluation.new(@args[0], difference) #args[0] is the value that should be the difference
        end
      end
    end
  end
end