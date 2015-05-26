var edit_complete = function() {
  $('.best_in_place').bind("ajax:success", function () {$(this).closest('tr').removeClass('new_setting', 1000); });
};

$(document).on("ready page:load", edit_complete);
