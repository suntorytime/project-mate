$(document).ready(function() {
  $('body').on('click', '.city_mates_button', function(e) {
    e.preventDefault();
    $('#city_mates').toggle()
    $(".city_mates_button").val("Hide");
  })
})
