# -*- encoding: utf-8 -*-

module Koala # :nodoc:
  module Generators # :nodoc:
    module TemplatePath # :nodoc:
      def source_root # :nodoc:
        @_koala_source_root ||= File.expand_path("../koala/#{generator_name}/templates", __FILE__)
      end
      
      def js_root # :nodoc:
        @_koala_js_root ||= File.expand_path("../../../vendor/assets/javascripts/precompiled", __FILE__)
      end
    end
  end
end
