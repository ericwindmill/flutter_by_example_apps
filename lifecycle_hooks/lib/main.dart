import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lifecycle_hooks/app_state_container.dart';
import 'package:meta/meta.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Lifecycle Hooks',
      theme: new ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State<Home> {
  List<Square> squares = [
    new Square(0, 'S1', Colors.purple[300]),
    new Square(1, 'S2', Colors.green[300]),
    new Square(2, 'S3', Colors.teal[300]),
    new Square(3, 'S4', Colors.deepOrange[300]),
  ];

  List<Color> randColor = [
    Colors.lightBlue[300],
    Colors.amber[300],
    Colors.cyan[300],
    Colors.indigo[300],
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void handleSquareChange() {
    var rand = new Random().nextInt(4);
    var rand2 = new Random().nextInt(4);

    setState(
        () => squares[rand] = new Square(4, 'newSquare', randColor[rand2]));
  }

  String title = "Lifecycle Demo";
  void changeTitle() {
    setState(() => title = "new title!");
  }

  Future<Null> handleRoute(context) async {
    var page = await Navigator.of(context).push(
          new MaterialPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return new Scaffold(
                  appBar: new AppBar(),
                  body: new SquaresGrid(squares: squares),
                );
              }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Lifecycle Hooks'),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.forward),
              onPressed: () => handleRoute(context),
            )
          ],
        ),
        body: new InheritedStateContainer(
            title: title, child: new SquaresGrid(squares: squares)),
        floatingActionButton: new FloatingActionButton(onPressed: changeTitle),
      ),
    );
  }
}

class SquaresGrid extends StatefulWidget {
  final List<Square> squares;

  SquaresGrid({Key key, this.squares}) : super(key: key);

  @override
  SquaresGridState createState() => new SquaresGridState();
}

class SquaresGridState extends State<SquaresGrid> {
  SquaresGridState();

  var state;

  @override
  Widget build(BuildContext context) {
//    print('build');
    return new Column(
      children: <Widget>[
        new Expanded(
          child: new GridView.count(
            crossAxisCount: 2,
            children: widget.squares.map((square) {
              return new ColorSquareWidget(square: square);
            }).toList(),
          ),
        ),
        new Text(state.title ?? "no state"),
      ],
    );
  }

  @override
  void initState() {
//    print('initState');
//    print('mounted? $mounted');
    super.initState();
  }

  @override
  void didUpdateWidget(SquaresGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
//    print('didUpdateWidget');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    state = context.inheritFromWidgetOfExactType(InheritedStateContainer);
    print('didChangeDependencies');
  }

  @override
  void deactivate() {
//    print('deactivate');
  }

  void dispose() {
    super.dispose();
//    print('dispose');
  }

  bool get isMounted => this.mounted;
}

class ColorSquareWidget extends StatelessWidget {
  final Square square;
  final GestureTapCallback onTap;

  const ColorSquareWidget({
    Key key,
    @required this.square,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: square.color,
        child: new InkWell(
            onTap: onTap,
            child: new Center(
              child: Text(square.name),
            )));
  }
}

class Square {
  final int id;
  final String name;
  final Color color;

  Square(this.id, this.name, this.color);
}
