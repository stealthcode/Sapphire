module Sapphire
  module Observers

    class ObserverRepository

      def self.create
        @@instance ||= ObserverRepository.new
      end

      def self.instance
        @@instance ||= self.create
      end

      def initialize
        @observers = []
        @observer_types = []
      end


      def Add(observer)
        return if(@observer_types.include? observer.class)

        @observer_types << observer.class
        @observers << observer if !@observers.include? observer
      end

      def Find(method, object)
        @observers.select {|o| ((o.object == object or o.object == :all or object < o.object) and (o.method == method or o.method == :all))  }
      end

      def self.observe()

      end
    end

  end
end