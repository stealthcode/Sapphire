module Sapphire
  module DSL
    class ControlEvaluation < Evaluation

      attr_reader :control

      def initialize(left, right, control)
        @control = control
        super left, right
      end
    end
  end
end