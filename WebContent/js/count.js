$(function() {
      $('#feed').keyup(function (e){
          var content = $(this).val();
          $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
          $('#counter').html(content.length + '/200');
      });
      $('#feed').keyup();
});

$(document).ready(function() {
    $('#feed').on('keyup', function() {
        if($(this).val().length > 199) {
            $(this).val($(this).val().substring(0, 199));
        }
    });
});

