module Sapphire
  module DSL
    module Profiles
      def Profile(name, &block)
        $profiles ||= {}
        $currentProfile = Profile.new(name)
        $profiles.merge! name => $currentProfile
        block.call()
        $currentProfile = nil
      end

      class Profile

        def initialize(name)
          @name = name
          @lookups = {}
        end

        def Add(lookup)
          @lookups.merge! lookup
        end

      end
    end
  end
end