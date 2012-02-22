module Sapphire
  module WebAbstractions
    class Image < Control
      def Source(value, comparator)
        image = self.Find
        evaluation = Evaluation.new(image.attribute("src"), value)
        EqualsComparison.new(evaluation)
      end

      def AltText(value, comparator)
        image = self.Find
        evaluation = Evaluation.new(image.attribute("alt"), value)
        EqualsComparison.new(evaluation)
      end
    end
  end
end


