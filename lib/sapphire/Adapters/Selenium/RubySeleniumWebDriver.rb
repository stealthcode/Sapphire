module Sapphire
  module WebAbstractions
    module RubySeleniumWebDriver

      attr_reader :rootUrl

      def Init(url)
        @rootUrl = url
      end

      def Close
        self.browser.close
      end

      def Switch
        self.browser.switch_to.window(self.browser.window_handles[0])
      end

      def Type(keys)
        self.browser.action.send_keys(keys).perform()
      end

      def AcceptAlert
        alert = self.browser.switch_to.alert
        alert.accept()
        self.browser.switch_to.window(self.browser.window_handles[0])
      end

      def SetAlert(text)
        alert = self.browser.switch_to.alert
        alert.send_keys(text)
        alert.accept()
        self.browser.switch_to.window(self.browser.window_handles[0])
      end

      def ClosePopup
        self.browser.switch_to.window(self.browser.window_handles.last)
        self.browser.close
        self.browser.switch_to.window(self.browser.window_handles[0])
      end

      def SwitchToPopup
        self.browser.switch_to.window(self.browser.window_handles.last)
      end

      def SetRootUrl(url)
        if(url.instance_of?(String))
          self.Init(url)
        else
          x = url.new().Url
          self.Init(x)
        end
      end

      def NavigateTo(page)
        if(page.is_a? Class)
          nav = page.new
        else
          nav = page
        end

        self.browser.get "https://" + nav.Url
        nav.Init
        nav
      end

      def CurrentUrl
        wait = Selenium::WebDriver::Wait.new(:timeout => 30)
        url = wait.until { x = self.browser.current_url
            x unless x == nil
        }

        url
      end

      def Reload
        self.browser.get self.CurrentUrl
      end

      def ShouldNavigateTo(page)
        if(page.is_a? Class)
          nav = page.new
        else
          nav = page
        end

        wait = Selenium::WebDriver::Wait.new(:timeout => 30)
        found = wait.until {
          x = self.CurrentUrl.upcase.start_with?("HTTP://" + nav.Url.upcase) || self.CurrentUrl.upcase.start_with?("HTTPS://" + nav.Url.upcase)
          if(x == false)
            nav.AlternateUrls.each do |url|
              x = self.CurrentUrl.upcase.start_with?("HTTP://" + url.upcase) || self.CurrentUrl.upcase.start_with?("HTTPS://" + url.upcase)
            end
          end
          x
        }
        temp = Evaluation.new(found, true)
        return temp, nav
      end

      def Run(background)
        scenario = background.new
        scenario.Run
      end

      def ShouldShow(page)
        self.ShouldNavigateTo page
      end

      def ShouldTransitionTo(url)
        if(url.instance_of?(String))
          temp = Evaluation.new(self.CurrentUrl.upcase.start_with?("HTTP://" + url.upcase) || self.CurrentUrl.upcase.start_with?("HTTPS://" + url.upcase), true)
          @rootUrl = url
        else
          x = url.new().Url
          temp = Evaluation.new(self.CurrentUrl.upcase.start_with?("HTTP://" + x.upcase) || self.CurrentUrl.upcase.start_with?("HTTPS://" + x.upcase), true)
          @rootUrl = x
        end

        return temp
      end

      def FindItem(array)
        masterWait = Selenium::WebDriver::Wait.new(:timeout => 30)

        element = masterWait.until {
          x = nil
          array.each do |item|

            if item.is_a? Hash
                begin
                  x = self.FindElement item.keys.first, item.fetch(item.keys.first)
                rescue
                  #do nothing, let it keep looping
                end
            end

            x = self.FindElement item[0], item[1] if item.is_a? Array

            return x if x != nil

          end if array.is_a? Array

          x = self.FindElement array.keys.first, array.fetch(hash.keys.first) if array.is_a? Hash
          return x if x != nil
        }
        return element if element != nil
        raise "Could not find control for array: " + array.to_s
      end

      def FindAllItems(array)
        masterWait = Selenium::WebDriver::Wait.new(:timeout => 30)

        element = masterWait.until {
          x = nil
          array.each do |item|

            if item.is_a? Hash
                begin
                  x = self.FindElements item.keys.first, item.fetch(item.keys.first)
                  x = nil if x.is_a? Array and x.empty?
                rescue
                  #do nothing, let it keep looping
                end
            end

            x = self.FindElements item[0], item[1] if item.is_a? Array
            x = nil if x.is_a? Array and x.empty?
            return x if x != nil

          end if array.is_a? Array

          x = self.FindElement array.keys.first, array.fetch(hash.keys.first) if array.is_a? Hash
          return x if x != nil
        }
        return element if element != nil
        raise "Could not find control for array: " + array.to_s
      end

      def FindElement(discriminator, selector)
         self.browser.find_element discriminator, selector
      end

      def FindElements(discriminator, selector)
        self.browser.find_elements discriminator, selector
      end

      def ExecuteScript(script)
        self.browser.execute_script(script)
      end

      def Create(type)
        Selenium::WebDriver.for type
      end
    end
  end
end


