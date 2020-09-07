$(document).ready(function() {
  console.log("Hello from Signup Validation");
  $("#new_user").validate({
    rules: {
      "user[firstname]": {
        required: true,
        maxlength: 25
      },
      "user[lastname]": {
        required: true,
        maxlength: 25
      },
      "user[password]": {
        required: true,
        minlength: 6,
        maxlength: 255
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
})
