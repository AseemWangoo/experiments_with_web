function webAlert(text) {
    alert(text);
}

function detectUserLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(success, error);
    } else {
        status.textContent = 'Geolocation is not supported by your browser';
    }
}

function success(position) {
    let latitude = position.coords.latitude;
    let longitude = position.coords.longitude;

    console.log('LAT', latitude);
    console.log('LONG', longitude);
}

function error() {
    status.textContent = 'Unable to get your location';
}