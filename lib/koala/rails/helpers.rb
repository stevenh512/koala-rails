# -*- encoding: utf-8 -*-
require 'active_support/concern'

module Koala # :nodoc:
  module Rails # :nodoc:
    module Helpers # :nodoc:
      extend ActiveSupport::Concern
      #include ActionController::Helpers
      included do
        helper_method :facebook_session
        helper_method :facebook_token
        helper_method :facebook_uid
      end
      
      module InstanceMethods
        #extend ActionController::Helpers
        def facebook_session # :nodoc:
          @facebook_session ||= Koala::Facebook::OAuth.new.get_user_info_from_cookie(cookies)
        end

        def facebook_token # :nodoc:
          facebook_session['access_token']
        end

        def facebook_uid # :nodoc:
          facebook_session['uid']
        end
      end
    end
  end
end