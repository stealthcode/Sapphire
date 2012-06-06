module Sapphire
  module DSL
    module Profiles
      def Table(name, &block)
        $currentProfile.Add(name => block)
      end
    end
  end
end