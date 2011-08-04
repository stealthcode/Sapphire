module Sapphire
  module DSL
    module Browser
      def Show(item)
        if(item.is_a? Hash)
          ExecuteHashAgainstControl(item) do |control, arg|
            wait = Selenium::WebDriver::Wait.new(:timeout => 10)
            text = wait.until { x = control
              x unless (!x.Equals(arg) && x.Equals(""))
            }

            return text.Equals(arg)
          end
        elsif(item.is_a? Symbol)
          return IsVisible(item) == true
        elsif(item.is_a? Class)
          temp, @page = @browser.ShouldNavigateTo item
          @page.Init
          return temp
        else
          @page = item
          @page.Init
          return true
        end
      end
    end
  end
end

