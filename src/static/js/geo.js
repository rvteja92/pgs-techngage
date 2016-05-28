var json_coords = { latitude: 17.384835549807114, longitude: 78.48769617080688 };

$(document).ready(function(){
    init();
    $('#mylocation').on('click',function() {
      myLocationOnMap();
    });
});

function myLocationOnMap()
{
    getLocation();
    $('#latitude').val(json_coords.latitude);
    $('#longitude').val(json_coords.longitude);
    $('#latitude').val().trigger('change');
    $('#longitude').trigger('change');
}

function init()
{
    getLocation();
    $('#pickerMap').locationpicker({
        location: { latitude: json_coords.latitude, longitude: json_coords.longitude },
        radius: 50,
        inputBinding:{
            latitudeInput: $('#latitude'),
            longitudeInput: $('#longitude')
        },
        enableAutocomplete: true
    });
}

function getLocation()
{
    if ( navigator.geolocation )
    {
    	navigator.geolocation.getCurrentPosition(getPosition, handleError);
    }

    function getPosition(pos)
    {
        json_coords = { latitude: pos.coords.latitude, longitude: pos.coords.longitude };
    }

    function handleError(error)
    {
        switch (error.code)
        {
            case error.PERMISSION_DENIED:
    			// User denied access to location. Perhaps redirect to alternate content?
    			console.log('Location: Permission was denied');
    			break;
    		case error.POSITION_UNAVAILABLE:
    			console.log('Location: Position is currently unavailable.');
    			break;
    		case error.PERMISSION_DENIED_TIMEOUT:
    			console.log('Location: User took to long to grant/deny permission.');
    			break;
    		case error.UNKNOWN_ERROR:
    			console.log('Location: An unknown error occurred.')
    			break;
        }
    }
}
