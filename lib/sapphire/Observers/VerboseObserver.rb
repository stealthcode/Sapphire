module Sapphire
  module Observers

    class VerboseObserver < Observer

      def initialize

        observes :class => :all,
                 :method => :all
      end

      def Before(instance, method, args)
        puts "before #{method} on #{instance}" if ENV["verbose"] == "true"
      end

      def After(instance, method, args)
        puts "after #{method} on #{instance}" if ENV["verbose"] == "true"
      end

      def OnSuccess(instance, method, result, args)
        puts "success #{method} on #{instance} with result #{result}" if ENV["verbose"] == "true"
      end

      def OnFailure(instance, method, exception, args)
        puts "failure #{method} on #{instance} with #{exception.backtrace} and #{args}" if ENV["verbose"] == "true"
      end

      def self.IsObserver()
        true
      end

    end

  end
end