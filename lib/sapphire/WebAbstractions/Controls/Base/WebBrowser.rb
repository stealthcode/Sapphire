module Sapphire
  module WebAbstractions
    module WebBrowser

      attr_reader :rootUrl

      def Init(url)
        @rootUrl = url
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
          nav = page.new self
        else
          nav = page
        end

        self.browser.get "https://" + nav.Url
        nav.Init
        nav
      end

      def CurrentUrl
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        url = wait.until { x = self.current_url
            x unless x == nil
        }

        url
      end

      def Reload
        self.browser.get self.CurrentUrl
      end

      def ShouldNavigateTo(page)
        if(page.is_a? Class)
          nav = page.new self
        else
          nav = page
        end

        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
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
        scenario = background.new self
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
    end
  end
end


