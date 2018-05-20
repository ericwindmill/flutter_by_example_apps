import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:math' as math;

class PivotTransition extends AnimatedWidget {
  PivotTransition({
    Key key,
    this.isReversed: false,
    this.alignment: FractionalOffset.center,
    @required Animation<double> turns,
    this.child,
  }) : super(key: key, listenable: turns);

  Animation<double> get turns => listenable;
  final FractionalOffset alignment;
  final Widget child;
  final bool isReversed;

  @override
  Widget build(BuildContext context) {
    final double turnsValue = turns.value;
    final Matrix4 transform = isReversed
        ? new Matrix4.rotationZ(-(turnsValue * math.pi * 2.0))
        : new Matrix4.rotationZ(turnsValue * math.PI * 2.0);
    return new Transform(
      transform: transform,
      alignment: alignment,
      child: child,
    );
  }
}

class PivotBobTransition extends AnimatedWidget {
  PivotBobTransition({
    Key key,
    this.alignment: FractionalOffset.center,
    @required Animation<double> turns,
    this.child,
  }) : super(key: key, listenable: turns);

  Animation<double> get turns => listenable;
  final FractionalOffset alignment;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double turnsValue = turns.value;
    final Matrix4 transform =
        new Matrix4.rotationZ((turnsValue * math.pi * 2.0) * .05);
    return new Transform(
      transform: transform,
      alignment: alignment,
      child: child,
    );
  }
}
