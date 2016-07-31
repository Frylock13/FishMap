var ready;
ready = function() {
  $('.sp-wrap').smoothproducts();
};

$(document).ready(ready);
$(document).on('page:load', ready);