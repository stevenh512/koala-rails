# -*- encoding: utf-8 -*-
require 'active_support/concern'

module Koala # :nodoc:
  module Rails # :nodoc:
    module Helpers # :nodoc:
      extend ActiveSupport::Concern

      included do
        helper_method :facebook_session
        helper_method :facebook_token
        helper_method :facebook_uid
      end
      
      module InstanceMethods
        def facebook_session # :nodoc:
          @facebook_session ||=
            oauth.get_user_info_from_cookie(cookies) ||
            oauth.parse_signed_request(param[:signed_request])
        end

        def facebook_token # :nodoc:
          session['access_token'] ||= facebook_session['access_token']
        end

        def facebook_uid # :nodoc:
          session['facebook_uid'] ||= facebook_session['uid']
        end
        
        def facebook
          @facebook_api ||= Koala::Facebook::API.new(facebook_token)
        end
        
        protected
        def facebook_logout # :nodoc:
          session['oauth'] = nil
          session['access_token'] = nil
          session['facebook_uid'] = nil
          @facebook_session = nil
          @facebook_api = nil
        end
        
        def oauth # :nodoc:
          session['oauth'] ||= Koala::Facebook::OAuth.new
        end
      end
    end
  end
end