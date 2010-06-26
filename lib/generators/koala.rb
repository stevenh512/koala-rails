# -*- encoding: utf-8 -*-
module Koala # :nodoc:
  module Generators # :nodoc:
    module TemplatePath # :nodoc:
      def source_root # :nodoc:
        @_koala_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'koala', generator_name, 'templates'))
      end
    end
  end
end