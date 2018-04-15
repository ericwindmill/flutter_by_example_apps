import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pageSize = MediaQuery.of(context).size;
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            alignment: Alignment.center,
            width: pageSize.width,
            height: pageSize.height,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.75, 1.0],
                colors: [
                  const Color(0xFF3767B0),
                  const Color(0xFF0EE592),
                ],
              ),
            ),
            child: new Text(
              'suite',
              style: Theme.of(context).textTheme.display4,
            ),
          ),
        ],
      ),
    );
  }
}
