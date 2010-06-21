require 'generators/koala'

module Koala
  module Generators
    class InstallGenerator < Rails::Generators::Base
      extend TemplatePath

      def copy_config_file
        template "config/facebook.yml.tt", "config/facebook.yml"
      end

    end
  end
end

