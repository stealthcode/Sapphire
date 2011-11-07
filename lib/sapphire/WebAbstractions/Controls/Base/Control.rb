module Sapphire
  module WebAbstractions
    class Control
      def initialize(browser, hash)
          @browser = browser
          @hash = hash
      end

      def Find
        @browser.Find(@hash)
      end

      def FindAll
        @browser.FindAll(@hash)
      end

      def FindWithoutWait
        @browser.FindElement @hash[0].keys.first, @hash[0].fetch(@hash[0].keys.first)
      end

      def Text
        text = self.Find
        text.text
      end

      def Click
        control = self.Find
        control.click
      end

      def MouseOver
        if @hash.is_a? Hash
          if(@hash.has_key?(:id))
            @browser.ExecuteScript("document.getElementById('"+ @hash.fetch(:id) +"').style.visibility = 'visible'; ")
          elsif (@hash.has_key?(:name))
            @browser.ExecuteScript("document.getElementByName('"+ @hash.fetch(:name) +"').style.visibility = 'visible'; ")
          elsif (@hash.has_key?(:xpath))
            @browser.ExecuteScript("document.evaluate( '" + @hash.fetch(:xpath) + "', document, null, XPathResult.ANY_TYPE, null ).iterateNext().style.visibility = 'visible'; ")
          end
        elsif @hash.is_a? Array
          if(@hash[0].has_key?(:id))
            @browser.ExecuteScript("document.getElementById('"+ @hash[0].fetch(:id) +"').style.visibility = 'visible'; ")
          elsif (@hash[0].has_key?(:name))
            @browser.ExecuteScript("document.getElementByName('"+ @hash[0].fetch(:name) +"').style.visibility = 'visible'; ")
          elsif (@hash[0].has_key?(:xpath))
            @browser.ExecuteScript("document.evaluate( '" + @hash[0].fetch(:xpath) + "', document, null, XPathResult.ANY_TYPE, null ).iterateNext().style.visibility = 'visible'; ")
          end
        end

        sleep(1)
      end

      def Equals(value)
         Evaluation.new(self.Text, value)
      end
    end
  end
end

