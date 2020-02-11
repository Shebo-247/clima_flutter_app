import 'package:location/location.dart';

class MyLocation{

  double latitude, longitude;

  Future<void> getCurrentLocation() async{
    var location = new Location();

    LocationData currentLocation;

    currentLocation = await location.getLocation();

    latitude = currentLocation.latitude;
    longitude = currentLocation.longitude;
  }

}