module KoalaRails
  module Helpers
    def facebook_cookies
      @facebook_cookies ||= Koala::Facebook::OAuth.new.get_user_from_cookie(cookies)
    end

    def facebook_token
      @facebook_token ||= facebook_cookies['access_token']
    end
  end
end

