module Sapphire
  module Events
    def From(source, items = nil)
      return { :source => source, :constraints => items }
    end
  end
end