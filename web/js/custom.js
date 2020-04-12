function webAlert(text) {
    alert(text);
}

function detectUserLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(success, error);
    } else {
        status.textContent = text;
        let text = 'Geolocation is not supported by your browser';
        console.log(text);
    }
}

function success(position) {
    let latitude = position.coords.latitude;
    let longitude = position.coords.longitude;

    console.log('LAT', latitude);
    console.log('LONG', longitude);
}

function error() {
    let text = 'User rejected the location request';
    status.textContent = text;
    console.log(text);
    alert(text);
}