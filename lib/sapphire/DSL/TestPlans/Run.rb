module Sapphire
  module DSL
    module TestPlans
      def Run(item)
        if(item.is_a? Job)
          job = item
          if(job.Arg)
            @command = job.Path + " " + job.Arg.to_s
          else
            @command = job.Path
          end


          psCommand = "& icm " + job.Server + " {" + @command + "}"
          psCommand = "powershell -inputformat none -command \"& {" + psCommand + "} \""
          puts ""
          puts ""
          puts "executing your job via powershell command: " + psCommand
          system psCommand
          puts ""
          puts ""

        else
          Runner.instance.last_test_plan.Add(item)
        end
      end
    end
  end
end