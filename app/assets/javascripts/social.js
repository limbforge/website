$( document ).ready(function() {

  window.fbAsyncInit = function() {
    FB.init({
      appId      : 'YOAPPIDGOESHERE',
      xfbml      : true,
      version    : 'v2.5'
    });
  };

  window.twttr = (function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0],
    t = window.twttr || {};
  if (d.getElementById(id)) return t;
  js = d.createElement(s);
  js.id = id;
  js.src = "https://platform.twitter.com/widgets.js";
  fjs.parentNode.insertBefore(js, fjs);

  t._e = [];
  t.ready = function(f) {
    t._e.push(f);
  };

  return t;
  }(document, "script", "twitter-wjs"));
});
