(function() {
  var Facebook;
  window.Facebook = Facebook = {
    /*
    	Begin configuration
    	*/
    app_id: "Facebook::APP_ID",
    scopes: "Facebook::SCOPES",
    /*
    	End configuration
    	*/
    channel: "" + document.location.protocol + "//" + document.location.host + "/channel.html",
    redirectLogin: function() {
      return top.location.href = "https://www.facebook.com/dialog/oauth?client_id=" + Facebook.app_id + "&redirect_uri=" + (escape(top.location)) + "&scope=" + (Facebook.scopes.join(","));
    },
    fbLogin: function() {
      /*
      		TODO: Implement login using FB.login()
      		*/
    },
    login: Facebook.redirectLogin,
    checkPermissions: function() {
      return FB.api('/me/permissions', function(response) {
        var data;
        data = response.data[0];
        if (data["installed"] !== 1) {
          Facebook.login();
        }
        return Facebook.scopes.every(function(scope) {
          if (data[scope] !== 1) {
            Facebook.login();
          }
          return true;
        });
      });
    },
    auth: function(response) {
      if (response.authResponse) {
        return Facebook.checkPermissions();
        /*
        			TODO: Get current user with FB.api("/me")
        			*/
      } else {
        return Facebook.login();
      }
    },
    onReady: function() {
      return FB.getLoginStatus(Facebook.auth);
    },
    asyncInit: function() {
      FB.init({
        appId: Facebook.app_id,
        status: true,
        cookie: true,
        xfbml: true,
        oauth: true,
        channelURL: Facebook.channel
      });
      return Facebook.onReady();
    }
  };
  window.fbAsyncInit = Facebook.asyncInit;
  $(function() {
    var cache;
    $('body').append('<div id="fb-root"></div>');
    cache = $.ajaxSettings.cache;
    $.ajaxSettings.cache = true;
    $.getScript("" + document.location.protocol + "//connect.facebook.net/en_US/all.js");
    return $.ajaxSettings.cache = cache;
  });
}).call(this);
