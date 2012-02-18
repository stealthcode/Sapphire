module Sapphire
  module DSL
    module Configuration
      def Use(user)
        if(user == ConfiguredUser)
          if AppConfig.Current.nil?
            raise "No App Config defined!"
          end
          $user = AppConfig.new().User
        else
          $user = user.new
        end
      end
    end
  end
end


