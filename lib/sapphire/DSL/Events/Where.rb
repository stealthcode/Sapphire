module Sapphire
  module DSL
    module Events
      def Where(hash, block)
        $currentConstraint = hash
        block.call()
        $currentConstraint = nil
      end
    end
  end
end