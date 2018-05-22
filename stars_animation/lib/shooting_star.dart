import 'package:flutter/widgets.dart';

class ShootingStar extends AnimatedWidget {
  final double top;
  final double left;
  final double width;
  final Animation<double> animationStep;

  ShootingStar({
    Key key,
    this.top,
    this.left,
    this.width: 450.0,
    this.animationStep,
  }) : super(key: key, listenable: animationStep);

  @override
  Widget build(BuildContext context) {
    final Tween<double> starTween = new Tween<double>(begin: width, end: 0.0);
    final Animation<double> animation = animationStep;

    return new Positioned(
      top: top,
      left: left,
      child: new Container(
        transform: new Matrix4.rotationZ(-0.5),
        width: starTween.evaluate(animation),
        height: 2.0,
        decoration: new BoxDecoration(
          color: const Color(0xFF2A2228),
        ),
        child: new Container(
          margin: new EdgeInsets.only(),
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              colors: [
                const Color(0xFF2A2228),
                const Color(0xFFFFFFFF),
              ],
              stops: ([0.9, 0.8]),
            ),
          ),
        ),
      ),
    );
  }
}
