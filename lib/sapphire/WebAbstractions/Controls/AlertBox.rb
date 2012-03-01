module Sapphire
  module WebAbstractions
    class AlertBox < Control
      def Accept
        $driver.AcceptAlert
      end

      def Set(text)
        $driver.SetAlert(text)
      end

      def Visible()
        Evaluation.new($driver.AlertShown(), true)
      end

      def Find(comparator = nil)
        return $driver.FindAlert
      end
    end
  end
end