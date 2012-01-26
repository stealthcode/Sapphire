module Sapphire
  module WebAbstractions
    class Page

      def AlternateUrls
        []
      end

      attr_reader :fields

      def initialize()
        @fields = []
      end

      def DropDown(*args)
        @fields << { args.first => DropDown.new(args[1..args.length]) }
      end

      def TextBox(*args)
        @fields << { args.first => TextBox.new(args[1..args.length]) }
      end

      def RadioButton(*args)
        @fields << { args.first => RadioButton.new(args[1..args.length]) }
      end

      def CheckBox(*args)
        @fields << { args.first => CheckBox.new(args[1..args.length]) }
      end

      def Button(*args)
        @fields << { args.first => Button.new(args[1..args.length]) }
      end

      def Label(*args)
        @fields << { args.first => Label.new(args[1..args.length]) }
      end

      def Image(*args)
        @fields << { args.first => Image.new(args[1..args.length]) }
      end

      def Hyperlink(*args)
        @fields << { args.first => Hyperlink.new(args[1..args.length]) }
      end

      def List(*args)
        @fields << { args.first => List.new(args[1..args.length]) }
      end

      def Date(*args)
        @fields << { args.first => Date.new(args[1..args.length]) }
      end

      def Date(*args)
        @fields << { args.first => Date.new(args[1]) }
      end

      def Contains(item)
        @fields.has_key? item
      end

    end
  end
end
