// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
    $(document).off('click', '#fetch_request_store_value');
    $(document).on('click', '#fetch_request_store_value', function () {
        $.ajax({
           url: $(this).data('path'),
           dataType: 'script',
           data: {
               format: 'js',
               request_key: $('#request_store_request_key').val()
           }
        });
    });
});