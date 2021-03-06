module Sapphire
  module DSL
    module Coverage
      #def Covers(item)
      #  Runner.instance.last_test_plan.Cover(item)
      #end

      def Covers(hash)
        token = hash.keys.first
        target = hash[hash.keys.first]

        if(token == :feature)
          $current_feature = target
        elsif(token == :requirement)
          $current_rule = target
        elsif(token == :behavior)
          feature = $features.select { |f| f.token == $current_feature }[0]
          requirement = feature.requirements.select { |r| r.token == $current_rule }[0]
          test = requirement.behaviors.select { |t| t.token == target }[0]
          test.is_covered = true
        end
      end
    end
  end
end
