module Sapphire
  module Observable
    def self.intercept(base, hash, *names)
      names.each do |name|
        method = base.instance_method(name)
        base.send :define_method, name.to_sym do |*args, &block|
          hash[:before].call(name, self, args) if hash.has_key? :before

          begin
            x = method.bind(self).(*args, &block)
            hash[:success].call(name, self, args) if hash.has_key? :success
            return x
          rescue => exception
            hash[:failure].call(name, self, exception, args) if hash.has_key? :failure
            raise exception
          ensure
            hash[:after].call(name, self, args) if hash.has_key? :after
          end
        end
      end
    end

    def self.included(base)
      before = proc { |name, inst, args|
        observers = Observers::ObserverRepository.instance.Find(name.to_sym, inst.class)
        observers.each do |x| x.Before(inst, name, args) if x.respond_to? :Before end
      }

      after = proc { |name, inst, args|
        observers = Observers::ObserverRepository.instance.Find(name.to_sym, inst.class)
        observers.each do |x| x.After(inst, name, args) if x.respond_to? :After end
      }

      success = proc { |name, inst, args|
        observers = Observers::ObserverRepository.instance.Find(name.to_sym, inst.class)
        observers.each do |x| x.OnSuccess(inst, name, args) if x.respond_to? :OnSuccess end
      }


      failure = proc { |name, inst, exception, args|
        observers = Observers::ObserverRepository.instance.Find(name.to_sym, inst.class)
        observers.each do |x| x.OnFailure(inst, name, exception, args) if x.respond_to? :OnFailure end
      }


      hash = {}

      hash.merge! :before => before,
                  :after => after,
                  :failure => failure,
                  :success => success

      intercept(base, hash, *base.instance_methods(false))
    end
  end
end