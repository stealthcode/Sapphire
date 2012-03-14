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

          psFile = "C:\\runjob.ps1"
          psCommand = "& icm " + job.Server + " {" + @command + "}"
          File.open(psFile, 'w') {|f| f.write(psCommand) }
          puts ""
          puts ""
          puts "executing your job via powershell command: " + psCommand
          system "powershell -inputformat none " + psFile
          File.delete(psFile)
          puts ""
          puts ""

        else
          Runner.instance.last_test_plan.Add(item)
        end
      end
    end
  end
end