$(document).ready(function() {
  $("#add_new_image").
    data("association-insertion-position", 'before').
    data("association-insertion-node", 'this');
});

$(function() {
  function check_to_hide_or_show_add_link() {
    if ($('#place_images .nested-fields').length == 3) {
      $('#place_images #add_new_image').hide();
    } else {
      $('#place_images #add_new_image').show();
    }
  }

  $('#place_images').bind('cocoon:after-insert', function() {
    check_to_hide_or_show_add_link();
  });

  $('#place_images').bind('cocoon:after-remove', function() {
    check_to_hide_or_show_add_link();
  });

  check_to_hide_or_show_add_link();     
});