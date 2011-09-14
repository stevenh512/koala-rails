# -*- encoding: utf-8 -*-
require 'generators/koala'

module Koala # :nodoc:
  module Generators # :nodoc:
    
    class InstallGenerator < ::Rails::Generators::Base # :nodoc:
      extend TemplatePath

      def copy_config_file # :nodoc:
        template "config/facebook.yml.tt", "config/facebook.yml"
      end
      
      def copy_channel_file # :nodoc:
        template "public/channel.html.tt", "public/channel.html"
      end
      
      def copy_compiled_js # :nodoc:
        copy "#{js_path}/fb_loader.js", "public/javascripts/fb_loader.js"
      end if ::Rails.version < "3.1"
    end
  end
end