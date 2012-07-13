module Sapphire
  module DSL
    class ControlEvaluation < Evaluation

      attr_reader :control

      def initialize(actual, expected, control)
        @control = control
        super actual, expected
      end
    end
  end
end