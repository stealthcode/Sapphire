module Sapphire
  module DSL
    module Browser

      def Matrix(symbol)
        return Matrix.new(symbol)
      end

      class Matrix

        attr_reader :id

        def initialize(id)
          @id = id
        end

        def Create(matrix, &block)
          $matrix_variable = matrix.id
          block.call
          $matrix_variable = nil
        end

        def Using(matrix, &block)
          raise "No matrix defined for: " + matrix.id if !$matrices.has_key? matrix.id

          $matrices[matrix.id].each do |array|
            array.each do |item|
              item.call()
            end
            block.call()
          end


        end

      end

    end
  end
end

