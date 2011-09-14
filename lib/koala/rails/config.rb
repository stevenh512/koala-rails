module Koala
  module Rails
    module Config
      def self.app_id
        config_hash['app_id']
      end
      
      def self.secret
        config_hash['secret']
      end
      
      def self.scopes
        config_hash['scopes']
      end
      
      protected
      def self.config_hash
        @config_hash ||= YAML.load(ERB.new(File.read(File.join(::Rails.application.root, "config", "facebook.yml"))).result)[::Rails.env]
      end
    end
  end
end