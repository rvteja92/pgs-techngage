$(document).ready(function(){
    init();
});

function init()
{
    getLocation();
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
