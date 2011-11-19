module Sapphire
  module Testing
    module Coverage
      def Test(token, hash)
        $features.last().AddTest(Test.new(token, hash))
      end

      class Test

        attr_reader   :token
        attr_reader   :type
        attr_accessor :is_covered
        attr_accessor :covered_by

        def initialize(token, hash)
          @token = token
          @type = hash[hash.keys.first]
        end

      end
    end
  end
end