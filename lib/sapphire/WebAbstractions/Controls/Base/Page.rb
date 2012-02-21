module Sapphire
  module WebAbstractions
    class Page

      def AlternateUrls
        []
      end

      attr_reader :fields

      def initialize()
        @fields = {}
        self.Init()
      end

      def Title(*args)
        @fields = @fields.merge! args.first => Title.new(nil)
      end

      def DropDown(*args)
        @fields = @fields.merge! args.first => DropDown.new(args[1..args.length])
      end

      def TextBox(*args)
        @fields = @fields.merge! args.first => TextBox.new(args[1..args.length])
      end

      def RadioButton(*args)
        @fields = @fields.merge! args.first => RadioButton.new(args[1..args.length])
      end

      def CheckBox(*args)
        @fields = @fields.merge!  args.first => CheckBox.new(args[1..args.length])
      end

      def Button(*args)
        @fields = @fields.merge! args.first => Button.new(args[1..args.length])
      end

      def Label(*args)
        @fields = @fields.merge! args.first => Label.new(args[1..args.length])
      end

      def Image(*args)
        @fields = @fields.merge! args.first => Image.new(args[1..args.length])
      end

      def Hyperlink(*args)
        @fields = @fields.merge! args.first => Hyperlink.new(args[1..args.length])
      end

      def List(*args)
        @fields = @fields.merge! args.first => List.new(args[1..args.length])
      end

      def Date(*args)
        @fields = @fields.merge! args.first => Date.new(args[1])
      end

      def AlertBox(*args)
        @fields = @fields.merge! args.first => AlertBox.new(nil)
      end

      def Contains(item)
        @fields.has_key? item
      end

      def Get(item)
        @fields[item]
      end

    end
  end
end
