// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

import "jquery-validation/dist/jquery.validate"

$(document).ready(function() {


  // script.js
  $("img").on({
    "click": function() {
      var title = $(this).parent().parent().find("div[name='title-post']").html();
      var source = $(this).attr("src");
      var description = $(this).parent().parent().find("div[name='description-post']").html()
      if ($("#btn-photo").hasClass("chosen")) {
        $("#modal-photo-title").html(title);
        $("#modal-photo-body").attr("src", source)
        $("#modal-photo-description").html(description);
        $("#modal-photo").modal('toggle')
      }
      else {
        $("#modal-album-title").html(title)
        $("#modal-album-description").html(description)
        $("#modal-album").modal('toggle');
      }
    }
  })
  $(".photo-modal-close").on( {
    "click": function() {
      $("#modal-photo").toggle();
    }
  })
  $(".album-modal-close").on( {
    "click": function() {
      $("#modal-album").toggle();
    }
  })
  $(".carousel-control-prev").on( {
    "click": function() {
      var inner = $(".carousel-inner")
      var noCarousel = inner.find('.carousel-item').length;
      var active = inner.find('.carousel-item.active')
      if (active.is(':first-child')) {
        active.removeClass("active")
        inner.children().last().addClass("active")
      }
      else {
        active.prev().addClass("active")
        active.removeClass("active")
      }
    }
  })
  $(".carousel-control-next").on( {
    "click": function() {
      var inner = $(".carousel-inner")
      var noCarousel = inner.find('.carousel-item').length;
      var active = inner.find('.carousel-item.active')
      if (active.is(':last-child')) {
        active.removeClass("active")
        inner.children().first().addClass("active")
      }
      else {
        active.next().addClass("active")
        active.removeClass("active")
      }
    }
  })
  $(".tab").on({
    "click": function() {
      var others = $(".tab").not(this);
      setAllTabOff();
      $(this).removeClass("text-secondary");
      $(this).addClass("text-color");
      var tabName = $(this).attr("name") + "-tab"
      $("div[name="+tabName+"]").removeClass("d-none")
      others.map(function() {
        $(this).removeClass("text-color");
        $(this).addClass("text-secondary");
      })
    }
  })



  // login_validation
  $("#login_form").validate({
    rules: {
      "user[email]": {
        required: true
      },
      "user[password]": {
        required: true
      }
    },
    messages: {
      "user[email]": {
        required: "Please enter your email"
      },
      "user[password]": {
        required: "Please enter your password"
      }
    },
  });



  // signup_validation
  $("#signup_form").validate({
    rules: {
      "user[firstname]": {
        required: true,
        maxlength: 25
      },
      "user[lastname]": {
        required: true,
        maxlength: 25
      },
      "user[email]": {
        required: true,
        maxlength: 255
      }
      ,
      "user[password]": {
        required: true,
        minlength: 6,
        maxlength: 64
      },
      "user[password_confirmation]": {
        required: true,
        minlength: 6,
        maxlength: 64,
        equalTo: "#user_password"
      }
    },
    messages: {
      "user[firstname]": {
        required: "Please enter your first name",
        maxlength: "Your first name must has at most 25 characters"
      },
      "user[lastname]": {
        required: "Please enter your last name",
        maxlength: "Your last name must has at most 25 characters"
      },
      "user[email]": {
        required: "Please enter your email",
        maxlength: "Your email must has at most 255 characters"
      }
      ,
      "user[password]": {
        required: "Please enter your password",
        minlength: "Your password must has at least 6 characters",
        maxlength: "Your first name must has at most 255 characters"
      },
      "user[password_confirmation]": {
        required: "Please enter your password",
        minlength: "Your password must has at least 6 characters",
        maxlength: "Your first name must has at most 64 characters",
        equalTo: "Please enter the same password as above"
      }
    },
  });

  // new_photo
  $("#new_photo").validate({
    rules: {
      "photo[title]": "required",
      "photo[description]": "required"
    },
    messages: {
      "photo[title]": "Please enter Photo title",
      "photo[description]": "Please enter Photo description"
    },
  });

  // new album validation
  $("#new_album").validate({
    rules: {
      "photo[title]": "required",
      "photo[description]": "required"
    },
    messages: {
      "photo[title]": "Please enter Photo title",
      "photo[description]": "Please enter Photo description"
    },
  });
});


function setAllTabOff() {
  $("div[name='photos-tab']").addClass("d-none");
  $("div[name='albums-tab']").addClass("d-none");
  $("div[name='followings-tab']").addClass("d-none");
  $("div[name='followers-tab']").addClass("d-none")
}
