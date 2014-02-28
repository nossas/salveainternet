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
    // scrollProgress = ((window.scrollY/$(document).height()) * 100) + "%";
    // invertedScrollProgress = (100 - ((window.scrollY/$(document).height()) * 100)) + "%";
    // $(".slide-2").css("background-position", scrollProgress + " " + scrollProgress);
    // $(".slide-3").css("background-position-y", scrollProgress);
    // $(".slide-4").css("background-position-x", scrollProgress);
    // $(".slide-5").css("background-position-x", invertedScrollProgress);
  });
});
