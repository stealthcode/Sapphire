module Sapphire
  module DSL
    module Browser
      def Set(hash)
        ExecuteHashAgainstControl(hash, @page) do |control, arg|
          control.Set arg
        end
      end
    end
  end
end

