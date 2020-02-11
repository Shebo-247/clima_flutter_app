import 'package:clima/services/location.dart';
import 'package:clima/services/network.dart';

const api_key = 'ade47431aab8acb1e12733a00d542864';
const mapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel{

  Future<dynamic> getLocationWeather() async{
    MyLocation location = MyLocation();
    await location.getCurrentLocation();

    NetworkHelper networkHelper =
    NetworkHelper('$mapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$api_key&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityLocation(String cityName) async{
    NetworkHelper networkHelper =
    NetworkHelper('$mapURL?q=$cityName&appid=$api_key&units=metric');

    var weatherData = await networkHelper.getData();

    if (weatherData == 404){
      return null;
    }
    else{
      return weatherData;
    }
  }

  String getWeatherIcon(int condition){
    if (condition <= 300){
      return 'tstorm1';
    }
    else if (condition == 800){
      return 'sunny';
    }
    else if (condition == 903){
      return 'snow3';
    }
    else if (condition == 904){
      return 'sunny';
    }
    else if (condition > 300){
      return 'light_rain';
    }
    else if (condition > 500){
      return 'shower3';
    }
    else if (condition > 600){
      return 'snow4';
    }
    else if (condition > 700){
      return 'fog';
    }
    else if (condition > 771){
      return 'tstorm3';
    }
    else if (condition > 800){
      return 'cloudy2';
    }
    else if (condition >= 900 && condition < 903){
      return 'snow4';
    }
    else if (condition >= 905 && condition < 100){
      return 'snow4';
    }
    else {
      return 'dunno';
    }
  }

}