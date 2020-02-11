import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

WeatherModel weatherModel = WeatherModel();

class LocationScreen extends StatefulWidget {
  final locationWeather;

  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int condition, temperature;
  String cityName, weatherIcon;

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        weatherIcon = 'dunno';
        temperature = 0;
        cityName = '';
        return;
      }

      condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);

      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();

      cityName = weatherData['name'];
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/clima_app_bg.jpg'),
                fit: BoxFit.cover)),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: FlatButton(
                  onPressed: () async {
                    var typedName = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CityScreen(),
                      ),
                    );

                    if (typedName != null) {
                      var weatherData =
                          await weatherModel.getCityLocation(typedName);
                      updateUI(weatherData);
                    }
                  },
                  child: Image.asset(
                    'images/switch.png',
                    height: 65.0,
                    width: 65.0,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    '$temperature°',
                    style: TextStyle(
                      fontSize: 110.0,
                      fontFamily: 'Helvetica Neue',
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Container(
                    child: Image(
                      image: AssetImage('images/$weatherIcon.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    '$cityName',
                    style: TextStyle(
                        fontSize: 45.0,
                        fontFamily: 'Helvetica Neue',
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
