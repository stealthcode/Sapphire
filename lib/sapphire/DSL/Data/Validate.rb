module Sapphire
  module DSL
    module Data
      def Validate(hash)
        hash.keys.each do |key|
          if(hash[key].is_a? Symbol)
            return GetPageField(hash[key]).Equals(key.to_s)
          else
            return key.to_s == hash[key].to_s
          end
        end
      end
    end
  end
end

