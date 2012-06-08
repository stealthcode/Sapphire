module Sapphire
  module Observable
    def self.before(base, *names)
      names.each do |name|
        m = base.instance_method(name)
        base.send :define_method, name.to_sym do |*args, &block|
          yield name, self
          m.bind(self).(*args, &block)
        end
      end
    end

    def self.included(base)
      before(base, *base.instance_methods(false)) { |name, inst|
        puts "Calling: #{name} on #{inst}"
      }
    end


  end
end