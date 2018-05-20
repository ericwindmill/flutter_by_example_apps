import 'package:flutter/material.dart';
import 'package:stars_animation/girl.dart';
import 'package:stars_animation/sky.dart';

void main() => runApp(new StarsAnimation());

class StarsAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new Stack(
          children: <Widget>[
            new SkyCircle(size: 250.0, top: -30.0, left: -30.0, radius: 120.0),
            new SkyCircle(size: 250.0, top: -30.0, left: 150.0, radius: 120.0),
            new SkyCircle(size: 220.0, top: 160.0, left: 10.0, radius: 107.0),
            new SkyCircle(size: 220.0, top: 160.0, left: 140.0, radius: 107.0),
            new SkyCircle(size: 170.0, top: 340.0, left: 40.0, radius: 81.0),
            new SkyCircle(size: 170.0, top: 340.0, left: 140.0, radius: 81.0),
            new SkyPoint(size: 180.0, top: 500.0, left: 125.0),
            new Arm(size: 100.0, top: 655.0, left: 233.0, rotate: 35.0),
            new Body(size: 180.0, top: 640.0, left: 235.0),
            new Leg(
                height: 80.0,
                width: 60.0,
                top: 688.0,
                left: 218.0,
                rotate: -33.0),
            new Shoe(size: 30.0, top: 740.0, left: 250.0, rotate: -24.0),
            new Toe(size: 35.0, top: 737.0, left: 247.0, rotate: 0.0),
            new Pants(size: 60.0, top: 723.0, left: 266.0),
            new Hair(size: 120.0, top: 630.0, left: 215.0),
            new Head(size: 70.0, top: 620.0, left: 190.0),
            new Pencil(size: 60.0, top: 695.0, left: 176.0, rotate: -15.0),
          ],
        ),
      ),
    );
  }
}
