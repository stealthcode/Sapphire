module Sapphire
  module Observers

    class ControlObserver < Observer

      def initialize

        observes :class => WebAbstractions::RubySeleniumWebDriver,
                 :method => :FindElement

      end

      def Notify(instance, method, args)

        discriminator = args[0]
        selector = args[1]

        if(discriminator == :id)
          instance.ExecuteScript("document.getElementById('#{selector}').style.backgroundColor = '#FFF467'; ")
        elsif (discriminator == :name )
          instance.ExecuteScript("document.getElementByName('#{selector}').style.backgroundColor = '#FFF467'; ")
        elsif (discriminator == :xpath)
          instance.ExecuteScript("document.evaluate( '#{selector}', document, null, XPathResult.ANY_TYPE, null ).iterateNext().style.backgroundColor = '#FFF467'; ")
        end

      end

      def self.IsObserver()
        true
      end

    end

  end
end