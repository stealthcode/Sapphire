module Sapphire
  module Plugins

    class Highlighter < Plugin

      def initialize

        observes :class => WebAbstractions::RubySeleniumWebDriver,
                 :method => :FindElement

      end

      def Before(instance, method, args)
        return if ENV["highlighter"] != "true"

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

      def self.IsObserver()
        true
      end

    end

  end
end