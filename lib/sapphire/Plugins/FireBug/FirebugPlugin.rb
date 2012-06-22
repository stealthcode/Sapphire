module Sapphire
  module Plugins

    class FirebugPlugin < Plugin

      def initialize

        observes :class => WebAbstractions::FireFoxBrowser,
                 :method => :Create

      end

      def Before(instance, method, args)
        return if ENV["firebug"] != "true"
        profile = Selenium::WebDriver::Firefox::Profile.new
        version = '1.9.1'
        profile.add_extension(File.expand_path("../firebug-#{version}.xpi", __FILE__))

        profile["extensions.firebug.currentVersion"] = "999"
        profile["extensions.firebug.allPagesActivation"] = "on"
        ['console', 'net', 'script'].each do |feature|
          profile["extensions.firebug.#{feature}.enableSites"] = true
        end

        profile["extensions.firebug.previousPlacement"] = 3

        args << { :profile => profile }
      end

      def self.IsObserver()
        true
      end

    end

  end
end