module Sapphire
  module WebAbstractions
    class Date < Control

      def Text
        control = self.Find
        return DateTime.strptime(control.text, "%m/%d/%Y %H:%M:%S %p").to_date
      end

    end
  end
end