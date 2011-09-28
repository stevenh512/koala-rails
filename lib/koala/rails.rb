require 'koala'
require 'rack-facebook-method-fix'
require 'koala/rails/version'

module Koala
  module Rails
    extend ActiveSupport::Autoload
    
    autoload :Config
    autoload :Helpers
    
    class Engine < ::Rails::Engine
      initializer "koala" do
        Koala::Facebook::OAuth.class_eval do
          def initialize_with_default_settings(*args)
            case args.size
              when 0, 1
                raise "application id and/or secret are not specified in the config" unless Koala::Rails::Config.app_id && Koala::Rails::Config.secret
                initialize_without_default_settings(Koala::Rails::Config.app_id, Koala::Rails::Config.secret, args.first)
              when 2, 3
                initialize_without_default_settings(*args)
            end
          end

          alias_method_chain :initialize, :default_settings
        end
        
        ActiveSupport.on_load(:action_controller) do
          ActionController::Base.send(:include, Koala::Rails::Helpers)
        end
      end

      initializer "koala.include_middelware" do
        config.app_middleware.insert_before Rack::MethodOverride, Rack::Facebook::MethodFix
      end
    end
  end
end
