module Sapphire
  module Plugins

    class VerbosePlugin < Plugin

      def initialize

        observes :class => :all,
                 :method => :all

      end

      def Before(instance, method, args)
        puts "before #{method} on #{instance}" if ENV["verbose"] == "true"
      end

      def After(instance, method, args)
        puts "after" if ENV["verbose"] == "true"
      end

      def OnSuccess(instance, method, args)
        puts "success" if ENV["verbose"] == "true"
      end

      def OnFailure(instance, method, exception, args)
        puts "failure" if ENV["verbose"] == "true"
      end

      #def self.IsObserver()
      #  true
      #end

    end

  end
end