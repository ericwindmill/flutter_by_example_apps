import 'package:flutter/widgets.dart';

class Star extends StatelessWidget {
  final double top;
  final double left;

  const Star({Key key, this.top, this.left}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      top: top,
      left: left,
      child: new Container(
        width: 15.0,
        height: 15.0,
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(50.0),
          gradient: new RadialGradient(
            center: Alignment.center, // near the top right
            radius: 0.3,
            colors: [
              const Color(0xFFFFFFFF),
              const Color(0xFF2A2138), // sky color
            ],
            stops: [0.1, 1.0],
          ),
        ),
      ),
    );
  }
}
