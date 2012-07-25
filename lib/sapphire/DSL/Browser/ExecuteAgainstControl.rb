module Sapphire
  module DSL
    module Browser
      def ExecuteHashAgainstControl(hash, &block)
        hash.keys.each do |key|
          return block.call($page.Get(key), hash[key]) if($page.Contains key)
        end

        raise "Cannot find control matching #{hash.to_s} for page #{$page.to_s}"
      end

      def ExecuteAgainstControl(item, &block)
        return block.call($page.Get(item), item) if($page.Contains item)

        raise "Cannot find controls matching: #{item.to_s} for page #{$page.to_s}"
      end
    end
  end
end

