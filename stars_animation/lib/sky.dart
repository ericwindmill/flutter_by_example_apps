import 'package:flutter/material.dart';
import 'package:stars_animation/animations.dart';

class SkyCircle extends StatefulWidget {
  final double size;
  final double top;
  final double radius;
  final double left;

  SkyCircle({this.size, this.top, this.left, this.radius});

  @override
  SkyCircleState createState() {
    return new SkyCircleState();
  }
}

class SkyCircleState extends State<SkyCircle>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  initState() {
    super.initState();
    _animationController = new AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      top: widget.top,
      left: widget.left,
      child: new PivotTransition(
        turns: _animationController,
        child: new Container(
          height: widget.size,
          width: widget.size,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(widget.radius),
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
    print(size.height);
    Path path = new Path();
    path.lineTo(0.0, size.height);
    path.lineTo((size.width - 80.0), 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => oldClipper != this;
}
