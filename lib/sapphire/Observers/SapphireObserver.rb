module Sapphire
  module Observers

    class SapphireObserver < Observer

      def initialize

        observes :class => :all,
                 :method => :all

      end

      def Notify(instance, method)
        #puts "Method #{method} called on instance #{instance} - type #{instance.class}."
      end

    end

  end
end