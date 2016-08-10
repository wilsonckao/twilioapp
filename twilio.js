$(document).ready(function(){
    $('#add_location').click(function(evt){
        $('.submit input').val('Getting location...').attr('disabled', 'true');
        evt.preventDefault();
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(pos){
                $('#message_lat').val(pos.coords.latitude);
                $('#message_lon').val(pos.coords.longitude);
                $('.submit input').val('Create Message').removeAttr('disabled');
            });
        } else {
            alert("Sorry could not find your location");
        }
    });

    $('.submit input').click(function(evt){
        evt.preventDefault();
        $.post("/messages", $('#new_message').serialize(), function(response){
            if(response.status == 'success'){
                alert('We sent your message to '+$('#message_to_number').val());
            }
        }, 'JSON');
    });
});```
