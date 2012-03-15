module Sapphire
  module DSL
    module Browser
      def For(item)
        return {item => GetPageField(item).Text} unless item.is_a? Data
        yield if block_given?
        item
      end
    end
  end
end
