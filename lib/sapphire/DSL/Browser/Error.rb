module Sapphire
  module DSL
    module Browser
      def Error(hash)
       ExecuteHashAgainstControl(hash) do |control, arg|
          return control.Equals(arg)
        end
      end
    end
  end
end

