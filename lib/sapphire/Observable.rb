module Sapphire
  module Observable
    def self.intercept(base, hash, *method_names)
      do_before = proc { |name, inst, args|
        begin
          hash[:before].call(name, inst, args)
        rescue => observer_exception

        end
      }

      do_on_success = proc { |name, inst, args|
        begin
          hash[:success].call(name, inst, args)
        rescue => raised_exception
          raise raised_exception
        end
      }

      do_on_failure = proc { |name, inst, raised_exception, args|
        begin
          hash[:failure].call(name, inst, raised_exception, args)
        rescue => observer_exception

        end
      }

      do_after = proc { |name, inst, args|
        begin
          hash[:after].call(name, inst, args)
        rescue => observer_exception

        end
      }

      method_names.each do |method_name|
        method = base.instance_method(method_name)
        base.send :define_method, method_name.to_sym do |*args, &method_block|
          do_before.call(method_name, self, args) if hash.has_key? :before
          begin
            result = method.bind(self).(*args, &method_block)
            do_after.call(method_name, self, args) if hash.has_key? :after
            return result
          rescue => raised_exception
            do_on_failure.call(method_name, self, raised_exception, args) if hash.has_key? :failure
            raise raised_exception
          ensure
            do_on_success.call(method_name, self, args) if hash.has_key? :success
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