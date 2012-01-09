module Sapphire
  module DSL
    module TestPlans
      def Run(item)
        if(item.is_a? Job)
          job = item
          if(job.Arg)
            system(job.PsExecPath + " " + job.Server + " " + job.Path + " " + job.Arg.to_s)
          else
            system(job.PsExecPath + " " + job.Server + " " + job.Path)
          end
        else
          Runner.instance.last_test_plan.Add(item)
        end
      end
    end
  end
end