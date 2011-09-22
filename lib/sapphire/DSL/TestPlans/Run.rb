module Sapphire
  module DSL
    module TestPlans
      def Run(item)
        if(item.is_a? Class)
          if(item.new.is_a? Job)
            job = item.new
            system(job.PsExecPath + " " + job.Server + " -u " + job.User + " -p " + job.Password + " " + job.Path)
          end
        else
          Runner.instance.last_test_plan.Add(item)
        end
      end
    end
  end
end
