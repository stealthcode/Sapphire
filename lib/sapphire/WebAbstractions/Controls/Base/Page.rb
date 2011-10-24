module Sapphire
  module WebAbstractions
    class Page

      def AlternateUrls
        []
      end

      attr_reader :fields

      def initialize(browser)
        @browser = browser
        @fields = []
      end

      def DropDown(*args)
        @fields << { args.first => DropDown.new(@browser, args[1..args.length]) }
      end

      def TextBox(*args)
        @fields << { args.first => TextBox.new(@browser, args[1..args.length]) }
      end

      def RadioButton(*args)
        @fields << { args.first => RadioButton.new(@browser, args[1..args.length]) }
      end

      def CheckBox(*args)
        @fields << { args.first => CheckBox.new(@browser, args[1..args.length]) }
      end

      def Button(*args)
        @fields << { args.first => Button.new(@browser, args[1..args.length]) }
      end

      def Label(*args)
        @fields << { args.first => Label.new(@browser, args[1..args.length]) }
      end

      def Image(*args)
        @fields << { args.first => Image.new(@browser, args[1..args.length]) }
      end

      def Hyperlink(*args)
        @fields << { args.first => Hyperlink.new(@browser, args[1..args.length]) }
      end

      def List(*args)
        @fields << { args.first => List.new(@browser, args[1..args.length]) }
      end

      def Date(*args)
        @fields << { args.first => Date.new(@browser, args[1..args.length]) }
      end

    end
  end
end
