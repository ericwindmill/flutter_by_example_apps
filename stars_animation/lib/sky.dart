import 'package:flutter/material.dart';
import 'package:stars_animation/animations.dart';


class SkyCircle extends StatelessWidget {
  final double size;
  final double top;
  final double radius;
  final double left;
  final AnimationController animationController;

  SkyCircle({this.size, this.top, this.left, this.radius, this.animationController});

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      top: top,
      left: left,
      child: new PivotTransition(
        turns: animationController,
        child: new Container(
          height: size,
          width: size,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(radius),
            color: new Color(0xFF2A2138),
          ),
        ),
      ),
    );
  }
}

class SkyPoint extends StatelessWidget {
  final double size;
  final double top;
  final double left;

  SkyPoint({this.size, this.top, this.left});

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      top: top,
      left: left,
      child: new Transform(
        transform: Matrix4.identity()..rotateZ(-15 * 3.1415927 / 180),
        child: new ClipPath(
          clipper: new TriangleClipper(),
          child: new Container(
            height: size,
            width: size,
            decoration: new BoxDecoration(
              color: new Color(0xFF2A2138),
            ),
          ),
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0.0, size.height);
    path.lineTo((size.width - 80.0), 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
