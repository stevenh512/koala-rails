# -*- encoding: utf-8 -*-
require 'generators/koala'

module Koala
  module Generators
    class InstallGenerator < Rails::Generators::Base
      extend TemplatePath

      def copy_config_file
        template "config/facebook.yml.tt", "config/facebook.yml"
      end

      def copy_initializer_file
        template "config/initializers/koala.rb.tt", "config/initializers/koala.rb"
      end

    end
  end
end

