$(document).ready(function(){
    init();
});

function init()
{
    $('body').on('click','#getLocation', function(e)
    {
        e.stopPropagation();
        e.stopImmediatePropagation();
        getLocation();
        return false;
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
        $('body').find('#latitude').val(pos.coords.latitude);
        $('body').find('#longitude').val(pos.coords.longitude);
    }

    function handleError(error)
    {
        switch (error.code)
        {
            case error.PERMISSION_DENIED:
    			// User denied access to location. Perhaps redirect to alternate content?
    			alert('Permission was denied');
    			break;
    		case error.POSITION_UNAVAILABLE:
    			alert('Position is currently unavailable.');
    			break;
    		case error.PERMISSION_DENIED_TIMEOUT:
    			alert('User took to long to grant/deny permission.');
    			break;
    		case error.UNKNOWN_ERROR:
    			alert('An unknown error occurred.')
    			break;
        }
    }
}
