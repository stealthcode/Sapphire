require File.expand_path('attrmethods', File.dirname(__FILE__))
require 'ostruct'

module Sapphire
  module Configuration
    class AppConfig < OpenStruct

      def self.create(hash)
        @@instance ||= Config.new hash
        @@instance
      end

      def self.Current
        @@instance
      end

      def Browser
        case($config["Browser"])
          when "Firefox" then FireFoxBrowser.new
          when "Chrome" then ChromeBrowser.new
          when "IE" then InternetExplorerBrowser.new
        end
      end

      def ConfiguredBrowser
        $config["Browser"]
      end

    end
  end
end
