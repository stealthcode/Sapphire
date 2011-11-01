module Sapphire
  module WebAbstractions
    class Control
      def initialize(browser, hash)
          @browser = browser
          @hash = hash
      end

      def Find
        masterWait = Selenium::WebDriver::Wait.new(:timeout => 30)

        element = masterWait.until {
          @hash.each do |item|
            wait = Selenium::WebDriver::Wait.new(:timeout => 1)
            begin
              y = wait.until {
                x = @browser.find_element item.keys.first, item.fetch(item.keys.first) if item.is_a? Hash
                x = @browser.find_element item[0], item[1] if item.is_a? Array
                return x if x != nil
              }
              return y if y != nil
            rescue
            end
          end if @hash.is_a? Array

          x = @browser.find_element @hash.keys.first, @hash.fetch(@hash.keys.first) if @hash.is_a? Hash
          return x if x != nil
          }
        return element if element != nil
        raise "Could not find control for symbol: " + @hash.to_s
      end

      def FindAll
        masterWait = Selenium::WebDriver::Wait.new(:timeout => 30)

        element = masterWait.until {
          @hash.each do |item|
            wait = Selenium::WebDriver::Wait.new(:timeout => 1)
            begin
              y = wait.until {
                x = @browser.find_elements item.keys.first, item.fetch(item.keys.first) if item.is_a? Hash
                x = @browser.find_elements item[0], item[1] if item.is_a? Array
                return x if x != nil
              }
              return y if y != nil
            rescue
            end
          end if @hash.is_a? Array

          x = @browser.find_elements @hash.keys.first, @hash.fetch(@hash.keys.first) if @hash.is_a? Hash
          return x if x != nil
          }
        return element if element != nil
        raise "Could not find control for symbol: " + @hash.to_s
      end

      def FindWithoutWait
        @browser.find_element @hash[0].keys.first, @hash[0].fetch(@hash[0].keys.first)
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
            @browser.execute_script("document.getElementById('"+ @hash.fetch(:id) +"').style.visibility = 'visible'; ")
          elsif (@hash.has_key?(:name))
            @browser.execute_script("document.getElementByName('"+ @hash.fetch(:name) +"').style.visibility = 'visible'; ")
          elsif (@hash.has_key?(:xpath))
            @browser.execute_script("document.evaluate( '" + @hash.fetch(:xpath) + "', document, null, XPathResult.ANY_TYPE, null ).iterateNext().style.visibility = 'visible'; ")
          end
        elsif @hash.is_a? Array
          if(@hash[0].has_key?(:id))
            @browser.execute_script("document.getElementById('"+ @hash[0].fetch(:id) +"').style.visibility = 'visible'; ")
          elsif (@hash[0].has_key?(:name))
            @browser.execute_script("document.getElementByName('"+ @hash[0].fetch(:name) +"').style.visibility = 'visible'; ")
          elsif (@hash[0].has_key?(:xpath))
            @browser.execute_script("document.evaluate( '" + @hash[0].fetch(:xpath) + "', document, null, XPathResult.ANY_TYPE, null ).iterateNext().style.visibility = 'visible'; ")
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

