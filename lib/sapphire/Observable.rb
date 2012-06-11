module Sapphire
  module Observable
    def self.before(base, *names)
      names.each do |name|
        m = base.instance_method(name)
        base.send :define_method, name.to_sym do |*args, &block|
          yield name, self, args
          m.bind(self).(*args, &block)
        end
      end
    end

    def self.included(base)
      before(base, *base.instance_methods(false)) { |name, inst, args|
        observers = Observers::ObserverRepository.instance.Find(name.to_sym, inst.class)
        observers.each do |x| x.Notify(inst, name, args) if x.respond_to? :Notify end
      }
    end
  end
end