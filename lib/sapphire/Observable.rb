module Sapphire
  module Observable
    def self.before(base, *names)
      names.each do |name|
        m = base.instance_method(name)
        puts name.to_s
        base.send :define_method, name.to_sym do |*args, &block|
          yield name
          m.bind(self).(*args, &block)
        end
      end
    end

    def self.included(base)
      before(base, *base.instance_methods(false)) { |name|
        puts "Calling: #{name} on #{base}"
      }
    end


  end
end