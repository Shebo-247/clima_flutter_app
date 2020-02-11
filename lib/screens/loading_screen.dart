import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'loading_progress.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  ProgressBar _sendingMsgProgressBar;

  @override
  void initState() {
    super.initState();
    _sendingMsgProgressBar = ProgressBar();
    getLocation();
  }

  @override
  void dispose() {
    _sendingMsgProgressBar.hide();
    super.dispose();
  }


  void showSendingProgressBar() {
    _sendingMsgProgressBar.show(context);
  }

  void hideSendingProgressBar() {
    _sendingMsgProgressBar.hide();
  }

  void getLocation() async {
    showSendingProgressBar();
    var weatherData = await WeatherModel().getLocationWeather();
    hideSendingProgressBar();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(locationWeather: weatherData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
