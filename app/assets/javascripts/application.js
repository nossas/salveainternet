// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require jquery.facebox
//= require_tree .

$.facebox.settings.closeImage = 'http://i.imgur.com/k9awT9O.png'
$.facebox.settings.loadingImage = 'http://i.imgur.com/bFbQqWu.gif'

$(function() {
  $(document).foundation();

  $(document).on('page:change', function() {
    return $.facebox.settings.inited = false;
  });  

  $('a[rel*=facebox]').facebox();

  if(window.location.hash){
    $.facebox({div: window.location.hash}, window.location.hash.replace("#", ""));
  }

  $(".facebook-share-button").click(function(event){
    window.open(
      $(event.target).attr("href"), 
      'facebox-share-dialog', 
      'width=626,height=436'
    ); 
    return false;
  });

  $.stellar();

  new_squeeze_y = $(".new_squeeze").position().top
  $(window).scroll(function(){
    if(window.scrollY >= new_squeeze_y){
      $(".form_wraper").addClass("fixed");
      $(".email_message").css("margin-top", $(".form_wraper").height() + "px");
    }
    else{
      $(".form_wraper").removeClass("fixed");
      $(".email_message").css("margin-top", "0");
    }

    // Parallax
    scrollRatio = window.scrollY/$(document).height();
    scrollProgress = ((window.scrollY/$(document).height()) * 100) + "%";
    invertedScrollProgress = (100 - ((window.scrollY/$(document).height()) * 100)) + "%";
    scrollProgressPx = ((window.scrollY/$(document).height()) * 1000) + "px";
    invertedScrollProgressPx = (10000 - (window.scrollY/$(document).height()) * 10000) + "px";
    
    slide3ScrollRatio = window.scrollY/$(".slide-3").position().top
    slide3ScrollRatio = slide3ScrollRatio > 1 ? 1 : slide3ScrollRatio
    slide3BgHeight = 720;
    slide3Height = $(".slide-3").height() + parseInt($(".slide-3").css("padding-top")) + parseInt($(".slide-3").css("padding-bottom"));
    slide3Offset = slide3BgHeight - slide3Height;
    slide3Position = (-slide3Offset * slide3ScrollRatio) + "px";

    slide6ScrollRatio = window.scrollY/$(".slide-6").position().top
    slide6ScrollRatio = slide6ScrollRatio > 1 ? 1 : slide6ScrollRatio
    slide6BgHeight = 720;
    slide6Height = $(".slide-6").height() + parseInt($(".slide-6").css("padding-top")) + parseInt($(".slide-6").css("padding-bottom"));
    slide6Offset = slide6BgHeight - slide6Height;
    slide6Position = (-slide6Offset * slide6ScrollRatio) + "px";

    slide7ScrollRatio = window.scrollY/$(".slide-7").position().top
    slide7ScrollRatio = slide7ScrollRatio > 1 ? 1 : slide7ScrollRatio
    slide7BgHeight = 720;
    slide7Height = $(".slide-7").height() + parseInt($(".slide-7").css("padding-top")) + parseInt($(".slide-7").css("padding-bottom"));
    slide7Offset = slide7BgHeight - slide7Height;
    slide7Position = (-slide7Offset * slide7ScrollRatio) + "px";
    
    $(".slide-1").css("background-position", "center " + scrollProgressPx);
    $(".slide-2").css("background-position-x", scrollProgress);
    $(".slide-3").css("background-position", "center " + slide3Position);
    $(".slide-4").css("background-position-x", scrollProgress);
    $(".slide-5").css("background-position-x", invertedScrollProgress);
    $(".slide-6").css("background-position", "center " + slide6Position);
    $(".slide-7").css("background-position", "center " + slide7Position);
  });
});
