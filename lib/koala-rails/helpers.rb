# -*- encoding: utf-8 -*-
module KoalaRails
  module Helpers
    def facebook_session
      @facebook_session ||= Koala::Facebook::OAuth.new.get_user_from_cookie(cookies)
    end

    def facebook_token
      @facebook_access_token ||= facebook_session['access_token']
    end

    def facebook_uid
      @facebook_uid ||= facebook_session['uid']
    end

    def facebook_session_key
      @facebook_session_key ||= facebook_session['session_key']
    end
  end
end

