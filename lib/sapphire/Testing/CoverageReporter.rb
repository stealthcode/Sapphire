module Sapphire
  module Testing
    class CoverageReporter

      def initialize()
        @output = $stdout
      end

      def OutputResults()
        @output.puts ""

        $features.each do |feature|
          @output.puts "Feature: " + feature.token.to_s

          feature.requirements.each do |requirement|
            @output.puts "\tRequirement: " + requirement.token.to_s


            positiveCount = 0
            negativeCount = 0
            boundaryCount = 0
            exceptionCount = 0

            expectedPositiveCount = 0
            expectedNegativeCount = 0
            expectedBoundaryCount = 0
            expectedExceptionCount = 0

            requirement.behaviors.each do |behavior|

              if behavior.type == :positive
                positiveCount += 1 if behavior.is_covered
                expectedPositiveCount += 1
              end

              if behavior.type == :negative
                negativeCount += 1 if behavior.is_covered
                expectedNegativeCount += 1
              end

              if behavior.type == :boundary
                boundaryCount += 1 if behavior.is_covered
                expectedBoundaryCount += 1
              end

              if behavior.type == :exception
                exceptionCount += 1 if behavior.is_covered
                expectedExceptionCount += 1
              end
            end

            @output.puts "\t\tPositive: " + positiveCount.to_s + "/" + expectedPositiveCount.to_s + " covered."
            @output.puts "\t\tNegative: " + negativeCount.to_s + "/" + expectedNegativeCount.to_s + " covered."
            @output.puts "\t\tBoundary: " + boundaryCount.to_s + "/" + expectedBoundaryCount.to_s + " covered."
            @output.puts "\t\tException: " + exceptionCount.to_s + "/" + expectedExceptionCount.to_s + " covered."
          end
        end
      end
    end
  end
end