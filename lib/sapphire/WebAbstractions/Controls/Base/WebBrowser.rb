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

        temp = self.CurrentUrl.upcase.start_with?("HTTP://" + nav.Url.upcase) || self.CurrentUrl.upcase.start_with?("HTTPS://" + nav.Url.upcase)

        #if you aren't on the expected page, check the alternate urls
        if(temp == false)
          nav.AlternateUrls.each do |url|
            temp = self.CurrentUrl.upcase.start_with?("HTTP://" + url.upcase) || self.CurrentUrl.upcase.start_with?("HTTPS://" + url.upcase)
            if(temp)
              return temp, nav
            end
          end
        end

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
          temp = self.CurrentUrl.upcase.start_with?("HTTP://" + url.upcase) || self.CurrentUrl.upcase.start_with?("HTTPS://" + url.upcase)
          @rootUrl = url
        else
          x = url.new().Url
          temp = self.CurrentUrl.upcase.start_with?("HTTP://" + x.upcase) || temp = self.CurrentUrl.upcase.start_with?("HTTPS://" + x.upcase)
          @rootUrl = x
        end

        return temp
      end
    end
  end
end


