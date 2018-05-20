import 'package:flutter/material.dart';
import 'package:stars_animation/animations.dart';

class Planet extends StatefulWidget {
  final double size;
  final double top;
  final double left;
  final Color color;
  final LinearGradient gradient;

  const Planet(
      {Key key, this.size, this.top, this.left, this.color, this.gradient})
      : super(key: key);

  @override
  PlanetState createState() {
    return new PlanetState();
  }
}

class PlanetState extends State<Planet> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  initState() {
    super.initState();
    _animationController = new AnimationController(
      duration: const Duration(milliseconds: 10000),
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
        alignment: FractionalOffset.centerLeft,
        child: new Container(
          width: widget.size,
          height: widget.size,
          decoration: new BoxDecoration(
            color: this.widget.color,
            gradient: widget.gradient,
            borderRadius: new BorderRadius.circular(50.0),
          ),
        ),
      ),
    );
  }
}
