module Sapphire
  module DSL
    module Browser
      def Remove(item)
        ExecuteHashAgainstControl(item) do |control, arg|
            wait = Selenium::WebDriver::Wait.new(:timeout => 20)
            begin
              evaluation = wait.until { x = control
                val = x.Text
                arr = item[item.keys.first]
                arr.delete(val)
                return nil
              }
            rescue
              return nil
            end
         end
      end
    end
  end
end