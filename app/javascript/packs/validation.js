$(document).ready(function() {
  console.log("Hello from validation.js glulululu")
  $("#edit_album_1").validate({
    rules: {
      "album[title]": {
        required: true
      }
    },
    messages: {
      "album[title]": "please enter new title"
    },
    errorPlacement:function(error, element) {
      error.insertAfter(element.nextAll().last());
    }
  });
})
