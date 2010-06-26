# -*- encoding: utf-8 -*-
require 'generators/koala'

module Koala # :nodoc:
  module Generators # :nodoc:
    class InstallGenerator < Rails::Generators::Base # :nodoc:
      extend TemplatePath

      def copy_config_file # :nodoc:
        template "config/facebook.yml.tt", "config/facebook.yml"
      end

      def copy_initializer_file # :nodoc:
        template "config/initializers/koala.rb.tt", "config/initializers/koala.rb"
      end

    end
  end
end