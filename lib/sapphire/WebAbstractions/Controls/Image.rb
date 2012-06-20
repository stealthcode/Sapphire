module Sapphire
  module WebAbstractions
    class Image < Control
      def Source(value, comparator)
        image = self.Find
        evaluation = ControlEvaluation.new(image.attribute("src"), value, self)
        EqualsComparison.new(evaluation)
      end

      def AltText(value, comparator)
        image = self.Find
        evaluation = ControlEvaluation.new(image.attribute("alt"), value, self)
        EqualsComparison.new(evaluation)
      end
    end
  end
end


