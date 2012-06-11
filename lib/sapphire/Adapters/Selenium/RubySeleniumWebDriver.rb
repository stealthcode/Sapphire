module Sapphire
  module WebAbstractions
    module RubySeleniumWebDriver

      attr_reader :rootUrl

      def Init(url)
        @rootUrl = url
      end

      def Browser()
        raise "Browser is null. Did you forget to start the browser?" if self.browser.nil?
        self.browser
      end

      def Screenshot(file_name)
        self.Browser().save_screenshot(file_name)
      end

      def Close
        self.Browser().close
      end

      def Switch
        self.Browser().switch_to.window(self.Browser().window_handles[0])
      end

      def Type(keys)
        self.Browser().action.send_keys(keys).perform()
      end

      def AcceptAlert
        alert = self.Browser().switch_to.alert
        alert.accept()
        self.Browser().switch_to.window(self.Browser().window_handles[0])
      end

      def SetAlert(text)
        alert = self.Browser().switch_to.alert
        alert.send_keys(text)
        alert.accept()
        self.Browser().switch_to.window(self.Browser().window_handles[0])
      end

      def FindAlert()
        begin
          return self.Browser().switch_to.alert
        rescue
          return nil
        end
      end

      def AlertShown()
        alert = self.FindAlert()
        return alert != nil
      end

      def ClosePopup
        self.Browser().switch_to.window(self.Browser().window_handles.last)
        self.Browser().close
        self.Browser().switch_to.window(self.Browser().window_handles[0])
      end

      def SwitchToPopup
        self.Browser().switch_to.window(self.Browser().window_handles.last)
      end

      def SwitchToIFrame(frame)
        self.Browser().switch_to.frame(frame)
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
          $page = page.new
        else
          $page = page
        end

        self.Browser().get $page.Url
        $page.Init
      end

      def CurrentUrl
        wait = Selenium::WebDriver::Wait.new(:timeout => 60)
        url = wait.until { x = self.Browser().current_url
            x unless x == nil
        }

        url
      end

      def Reload
        self.Browser().get self.CurrentUrl
      end

      def GetValue(item, key)

        if item.is_a? Array
          item.each do |sub_item|
            value = GetValue(sub_item, key)
            return value if !value.nil?
          end
        end

        if item.is_a? Class and key.nil?
          return item.new
        end

        if item.is_a? Hash
          return item[key] if item.has_key? key
        end

        nil
      end

      def ShouldNavigateTo(page, comparator)

        $page = GetValue(page, nil)
        $page ||= page

        timeout = GetValue(page, :wait)
        timeout ||= 60

        $page.Init

        wait = Selenium::WebDriver::Wait.new(:timeout => timeout)
        begin
          item = wait.until {
            x = self.CurrentUrl.upcase.start_with?($page.Url.upcase)
            y = StartsWithComparison.new(Evaluation.new(self.CurrentUrl.upcase, $page.Url.upcase))
            if(comparator.Compare(x == false, true))
              $page.AlternateUrls.each do |url|
                if(comparator.Compare(x == false, true))
                  x = self.CurrentUrl.upcase.start_with?(url.upcase)
                  y = StartsWithComparison.new(Evaluation.new(self.CurrentUrl.upcase, url.upcase))
                end
              end
            end

            return y if comparator.Compare(x == true, true)
          }
        rescue
          temp = StartsWithComparison.new(Evaluation.new(self.CurrentUrl, $page.Url))
          return temp
        end

        temp = item
        return temp
      end

      def Run(background)
        scenario = background.new
        scenario.Run
      end

      def ShouldTransitionTo(url, comparator)
        if(url.instance_of?(String))
          temp = StartsWithComparison.new(Evaluation.new(self.CurrentUrl.upcase, url.upcase))
          @rootUrl = url
        else
          x = url.new().Url
          temp = StartsWithComparison.new(Evaluation.new(self.CurrentUrl.upcase, x.upcase))
          @rootUrl = x
        end

        return temp
      end

      def FindItem(array, comparator = nil)

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
          return x if comparator.Compare(x != nil, true) if comparator != nil

        end if array.is_a? Array

        x = self.FindElement array.keys.first, array.fetch(array.keys.first) if array.is_a? Hash
        return x if x != nil
        return x if comparator.Compare(x != nil, true) if comparator != nil

      end

      def FindItemWithWait(array, comparator=nil)
        masterWait = Selenium::WebDriver::Wait.new(:timeout => 20)

        element = masterWait.until {
          x = FindItem(array, comparator)
          return x if x != nil
          return x if comparator.Compare(x != nil, true) if comparator != nil
        }

        return element if element != nil
        return element if comparator.Compare(element != nil, true) if comparator != nil
        raise "Could not find control for array: " + array.to_s

      end

      def FindItemWithoutWait(array, comparator=nil)

        element = FindItem(array, comparator)

        return element if element != nil
        return element if comparator.Compare(element != nil, true) if comparator != nil
        raise "Could not find control for array: " + array.to_s

      end

      def FindAllItems(array)
        masterWait = Selenium::WebDriver::Wait.new(:timeout => 20)

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

          x = self.FindElement array.keys.first, array.fetch(array.keys.first) if array.is_a? Hash
          return x if x != nil
        }
        return element if element != nil
        raise "Could not find control for array: " + array.to_s
      end

      def FindElement(discriminator, selector)
        self.Browser().find_element discriminator, selector
      end

      def FindElements(discriminator, selector)
        self.Browser().find_elements discriminator, selector
      end

      def ExecuteScript(script)
        self.Browser().execute_script(script)
      end

      def Create(type)
        Selenium::WebDriver.for type
      end

      include Sapphire::Observable
    end
  end
end