module Sapphire
  module DSL
    module Browser
      def Virtually(&block)
        ui = VirtualUI.new
        begin
          ui.Create()
          block.call
        ensure
          ui.Close()
        end
      end
    end
  end
end