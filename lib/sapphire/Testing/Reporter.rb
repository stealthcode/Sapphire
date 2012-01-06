module Sapphire
  module Testing
    class Reporter

      attr_reader :test_count
      attr_reader :passing_count
      attr_reader :failing_count
      attr_reader :pending_count
      attr_reader :problematic_count
      attr_reader :time

    end
  end
end