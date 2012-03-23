require 'ostruct'

module Sapphire
  module Configuration
    class AppConfig < OpenStruct

      def self.create(hash)
        @@instance ||= AppConfig.new hash
        @@instance
      end

      def self.Current
        @@instance if $config
      end

      def Browser
        case(ENV["browser"] || $config["Browser"])
          when "Firefox" then FireFoxBrowser.new
          when "Chrome" then ChromeBrowser.new
          when "IE" then InternetExplorerBrowser.new
        end
      end

      def ConfiguredBrowser
        ENV["browser"] || $config["Browser"]
      end

    end
  end
end
