import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProgressBar {
  OverlayEntry _progressOverlayEntry;

  void show(BuildContext context) {
    _progressOverlayEntry = _createdProgressEntry(context);
    Overlay.of(context).insert(_progressOverlayEntry);
  }

  void hide() {
    if (_progressOverlayEntry != null) {
      _progressOverlayEntry.remove();
      _progressOverlayEntry = null;
    }
  }

  OverlayEntry _createdProgressEntry(BuildContext context) => OverlayEntry(
      builder: (BuildContext context) => Stack(
            children: <Widget>[
              Container(
                color: Colors.lightBlue.withOpacity(0.5),
              ),
              Positioned(
                top: screenHeight(context) / 2,
                left: screenWidth(context) / 2,
                child: SpinKitChasingDots(
                  color: Colors.white,
                  size: 50.0,
                ),
              )
            ],
          ));

  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
}
