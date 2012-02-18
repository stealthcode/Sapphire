module Sapphire
  module DataAbstractions
    module Query
      def Execute(block)
          x = self.Database.new

          x.Open $config[x.Connection]
          y = ""
          y = AppConfig.Current.SqlPath if AppConfig.Current
          path = File.expand_path(y + self.Script, __FILE__)
          file = File.open(path)
          contents = file.read
          self.Tokenize(contents)

          results = x.query(contents)
          block.call results
          x.close
        end
      end
  end
end