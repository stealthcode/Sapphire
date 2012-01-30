module Sapphire
  module DSL
    module Browser
      def On(page)
        found = $browser.CurrentUrl.upcase.start_with?("HTTP://" + page.Url.upcase) || $browser.CurrentUrl.upcase.start_with?("HTTPS://" + page.Url.upcase)
        if(found == false)
          page.AlternateUrls.each do |url|
            if( found == false)
              found = $browser.CurrentUrl.upcase.start_with?("HTTP://" + url.upcase) || $browser.CurrentUrl.upcase.start_with?("HTTPS://" + url.upcase)
            end
          end
        end

        return found
      end
    end
  end
end
