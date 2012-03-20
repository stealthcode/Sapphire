module Sapphire
  module Events
    def Table(item, &block)
      $profiles[$current_profile].Add(Table.new(item, block))
    end

    class Table

      attr_reader :symbol
      attr_reader :block

      def initialize(symbol, block)
        @symbol = symbol
        @block = block
      end
    end
  end
end