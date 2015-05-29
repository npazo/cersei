var date_picker = function () {
  $('#datetimepicker').datetimepicker({
    format: 'MM-DD-YYYY h:mm a'
  });
};
            
$(document).on("ready page:load", date_picker);
