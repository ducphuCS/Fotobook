$(document).ready(function() {
  console.log("Hello from Login Validation");
  $("#new_user").validate({
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
})
