module Sapphire
  module DSL
    module TestPlans

      def Parameter(item)
        Parameters.instance.Add(item) if item.is_a? Hash
        return Parameters.instance.Get(item) if item.is_a? Symbol
      end

      class Parameters
        def self.create
          @@instance ||= Parameters.new
        end

        def self.instance
          @@instance ||= self.create
        end

        def initialize()
          $parameters ||= {}
        end

        def Add(item)
          $parameters.merge! item
        end

        def Contains(item)
          $parameters.has_key? item
        end

        def Get(item)
          $parameters[item]
        end
      end

    end
  end
end