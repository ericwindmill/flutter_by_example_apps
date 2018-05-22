import 'package:flutter/material.dart';

class Head extends StatelessWidget {
  final double size;
  final double top;
  final double left;

  Head({this.size, this.top, this.left});

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      top: top,
      left: left,
      child: new Container(
        height: size,
        width: size,
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(90.0),
          gradient: new LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.5, 0.9],
            colors: [
              new Color(0xFF555555),
              new Color(0xFF111111),
              new Color(0xFF000000),
            ],
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  final double size;
  final double top;
  final double left;

  Body({this.size, this.top, this.left});

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      top: top,
      left: left,
      child: new ClipRect(
        child: new Align(
          alignment: Alignment.topRight,
          heightFactor: 0.5,
          widthFactor: 0.5,
          child: new Stack(
            children: <Widget>[
              new Container(
                height: size,
                width: size,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(90.0),
                  color: new Color(0xFFFC2671),
                ),
              ),
              new Positioned(
                top: (size / 2 - (size / 6)),
                left: (size / 2 - (size / 6)),
                child: new Container(
                  height: size / 3,
                  width: size / 3,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(90.0),
                    color: new Color(0xFFFFFFFF),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Pants extends StatelessWidget {
  final double size;
  final double top;
  final double left;

  Pants({this.size, this.top, this.left});

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      top: top,
      left: left,
      child: new ClipRect(
        child: new Align(
          alignment: Alignment.bottomCenter,
          heightFactor: 0.5,
          child: new Container(
            height: size,
            width: size,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(90.0),
              color: new Color(0xFF3089F7),
            ),
          ),
        ),
      ),
    );
  }
}

class Leg extends StatelessWidget {
  final double height;
  final double width;
  final double top;
  final double left;
  final double rotate;

  Leg({this.top, this.left, this.height, this.width, this.rotate});

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      top: top,
      left: left,
      child: new Transform(
        transform: Matrix4.identity()..rotateZ(rotate * 3.1415927 / 180),
        child: new ClipRect(
          child: new Align(
            alignment: Alignment.centerRight,
            widthFactor: 0.4,
            child: new Container(
              height: height,
              width: width,
              decoration: new BoxDecoration(
                color: new Color(0xffdb7d7d),
                borderRadius: new BorderRadius.circular(90.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Pencil extends StatelessWidget {
  final double size;
  final double top;
  final double left;
  final double rotate;

  const Pencil({Key key, this.size, this.top, this.left, this.rotate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      top: top,
      left: left,
      child: new Transform(
        transform: Matrix4.identity()..rotateZ(rotate * 3.1415927 / 180),
        child: new Container(
          height: size,
          width: 6.0,
          decoration: new BoxDecoration(
            color: new Color(0xFF000000),
          ),
        ),
      ),
    );
  }
}

class Shoe extends StatelessWidget {
  final double size;
  final double top;
  final double left;
  final double rotate;

  const Shoe({Key key, this.size, this.top, this.left, this.rotate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      top: top,
      left: left,
      child: new Transform(
        transform: Matrix4.identity()..rotateZ(rotate * 3.1415927 / 180),
        child: new Container(
          height: size,
          width: size,
          decoration: new BoxDecoration(
            color: new Color(0xFF333333),
          ),
        ),
      ),
    );
  }
}

class Toe extends StatelessWidget {
  final double size;
  final double top;
  final double left;
  final double rotate;

  Toe({this.size, this.top, this.left, this.rotate});

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      top: top,
      left: left,
      child: new Transform(
        transform: Matrix4.identity()..rotateZ(rotate * 3.1415927 / 180),
        child: new ClipPath(
          clipper: new ToeClipper(),
          child: new Container(
            height: size,
            width: size * 1.2,
            decoration: new BoxDecoration(
              color: new Color(0xFF333333),
            ),
          ),
        ),
      ),
    );
  }
}

class ToeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.moveTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class Arm extends StatelessWidget {
  final double size;
  final double top;
  final double left;
  final double rotate;

  const Arm({Key key, this.size, this.top, this.left, this.rotate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      top: top,
      left: left,
      child: new Transform(
        transform: Matrix4.identity()..rotateZ(rotate * 3.1415927 / 180),
        child: new Container(
          height: size,
          width: 18.0,
          decoration: new BoxDecoration(
            color: new Color(0xFFdb7d7d),
            borderRadius: new BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}

class Hair extends StatelessWidget {
  final double size;
  final double top;
  final double left;

  const Hair({Key key, this.size, this.top, this.left}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      top: top,
      left: left,
      child: new ClipOval(
        child: new Container(
          height: size,
          width: 28.0,
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                new Color(0xFF222222),
                new Color(0xFF111111),
                new Color(0xFF000000),
                new Color(0xFF000000),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
