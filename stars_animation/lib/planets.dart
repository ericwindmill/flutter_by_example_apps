import 'package:flutter/material.dart';
import 'package:stars_animation/animations.dart';

class Planet extends StatelessWidget {
  final double size;
  final double top;
  final double left;
  final Color color;
  final LinearGradient gradient;
  final FractionalOffset pivotAlignment;
  final AnimationController animationController;
  final double ringWidth;
  final bool reverse;

  const Planet({
    Key key,
    this.size,
    this.top,
    this.left,
    this.color,
    this.gradient,
    this.pivotAlignment,
    this.animationController,
    this.ringWidth,
    this.reverse: false,
  }) : super(key: key);

  Widget get planetWithRings {
    var planetSize = size * .8;
    var planetHorPos = ((size * .2) / 2);
    return new Positioned(
      top: top,
      left: left,
      child: new PivotBobTransition(
        turns: animationController,
        alignment: pivotAlignment,
        child: new Container(
          width: size,
          height: size,
          child: new Stack(
            children: <Widget>[
              new Positioned(
                left: planetHorPos,
                child: new Container(
                  width: planetSize,
                  height: planetSize,
                  decoration: new BoxDecoration(
                    color: color,
                    gradient: gradient,
                    borderRadius: new BorderRadius.circular(50.0),
                  ),
                ),
              ),
              new Positioned(
                top: planetSize / 2 - (planetHorPos),
                child: new Container(
                  height: ringWidth,
                  width: size,
                  decoration: new BoxDecoration(
                    color: color,
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (ringWidth != null) {
      return planetWithRings;
    } else {
      return new Positioned(
        top: top,
        left: left,
        child: new PivotTransition(
          isReversed: reverse,
          turns: animationController,
          alignment: pivotAlignment,
          child: new Container(
            width: size,
            height: size,
            decoration: new BoxDecoration(
              color: color,
              gradient: gradient,
              borderRadius: new BorderRadius.circular(50.0),
            ),
          ),
        ),
      );
    }
  }
}
