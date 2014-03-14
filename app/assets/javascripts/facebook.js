// Load Facebook lib
$(function(){
  $('body').prepend('<div id="fb-root"></div>');
  return $.ajax({
    url: "" + window.location.protocol + "//connect.facebook.net/en_US/all.js",
    dataType: 'script',
    cache: true
  });
});

// Facebook init
window.fbAsyncInit = function() {
  FB.init({
    appId: $("meta[property='fb:app_id']").attr("content"),
    cookie: true
  });
};
