// https://developer.mozilla.org/en-US/docs/Web/API/Geolocation_API

// navigator.geolocation -> entry point into the API...

@JS('navigator.geolocation')
library weblocation;

import 'package:js/js.dart';

// Retrieves the device's current location
@JS('getCurrentPosition')
external void getCurrentPosition();
