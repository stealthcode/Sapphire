module Sapphire
  module Observers

    class FailedControlHighlighter < Observer

      def initialize

        observes :class => DSL::ControlEvaluation,
                 :method => :Failed

      end

      def Before(instance, method, args)
        return if ENV["highlighter"] != "true"

        control = args[0]
        discriminator = control.found_by_type
        selector = control.found_by_value

        begin
          if(discriminator == :id)
            $driver.ExecuteScript("document.getElementById('#{selector}').style.backgroundColor = '#FF0000'; ")
          elsif (discriminator == :name )
            $driver.ExecuteScript("document.getElementByName('#{selector}').style.backgroundColor = '#FF0000'; ")
          elsif (discriminator == :xpath)
            $driver.ExecuteScript("document.evaluate( '#{selector}', document, null, XPathResult.ANY_TYPE, null ).iterateNext().style.backgroundColor = '#FF0000'; ")
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