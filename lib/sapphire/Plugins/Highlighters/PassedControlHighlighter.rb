module Sapphire
  module Plugins

    class PassedControlHighlighter < Plugin

      def initialize

        observes :class => DSL::ControlEvaluation,
                 :method => :Passed

      end

      def Before(instance, method, args)
        return if ENV["highlighter"] != "true"

        control = args[0]

        discriminator = control.found_by_type
        selector = control.found_by_value

        begin
          if(discriminator == :id)
            $driver.ExecuteScript("document.getElementById('#{selector}').style.border = '1px solid #00FF00'; ")
          elsif (discriminator == :name )
            $driver.ExecuteScript("document.getElementByName('#{selector}').style.border = '1px solid #00FF00'; ")
          elsif (discriminator == :xpath)
            $driver.ExecuteScript("document.evaluate( '#{selector}', document, null, XPathResult.ANY_TYPE, null ).iterateNext().style.border = '1px solid #00FF00'; ")
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