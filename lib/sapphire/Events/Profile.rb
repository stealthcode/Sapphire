module Sapphire
  module Events
    def Profile(symbol)
      $profiles ||= {}
      $profiles.merge! symbol => Profile.new(symbol)
      yield if block_given?
      $current_profile = nil
    end

    class Profile

      attr_reader :symbol

      def initialize(symbol)
        @symbol = symbol
        $current_profile = symbol
        @tables = []
      end

      def Add(table)
        @tables << table
      end

    end
  end
end