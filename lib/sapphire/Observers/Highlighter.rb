module Sapphire
  module Observers

    class Highlighter < Observer

      def initialize

        observes :class => WebAbstractions::RubySeleniumWebDriver,
                 :method => :FindElement

      end

      def Before(instance, method, args)
        return if ENV["spectator"] != "true"

        discriminator = args[0]
        selector = args[1]

        begin
          if(discriminator == :id)
            instance.ExecuteScript("document.getElementById('#{selector}').style.backgroundColor = '#FFF467'; ")
          elsif (discriminator == :name )
            instance.ExecuteScript("document.getElementByName('#{selector}').style.backgroundColor = '#FFF467'; ")
          elsif (discriminator == :xpath)
            instance.ExecuteScript("document.evaluate( '#{selector}', document, null, XPathResult.ANY_TYPE, null ).iterateNext().style.backgroundColor = '#FFF467'; ")
          end

        rescue
        end

      end

      def After(instance, method, args)
        #puts "yay after"
      end

      def OnSuccess(instance, method, args)
        #puts "yay success"
      end

      def OnFailure(instance, method, exception, args)
        #puts "yay failure"
      end

      def self.IsObserver()
        true
      end

    end

  end
end