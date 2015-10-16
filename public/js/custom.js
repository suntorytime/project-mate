$(document).ready(function() {
  $('body').on('click', '.city_mates_button', function(e) {
    e.preventDefault();
    $('#city_mates').slideToggle()
  })
})
