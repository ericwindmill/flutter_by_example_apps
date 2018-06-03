import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lifecycle_hooks/app_state_container.dart';
import 'package:meta/meta.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  Color initColor = Colors.white;
  Color dependencyDidUpdateColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Lifecycle Hooks',
      theme: new ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: new Scaffold(
        appBar: new AppBar(),
        body: new Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              width: 300.0,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Mounted(title: "Mounted", color: Colors.white),
                  new Mounted(title: "Unmounted", color: Colors.white),
                ],
              ),
            ),
            new LifecycleHook(title: 'initState', color: initColor),
            new LifecycleHook(
                title: 'dependeciesDidUpdate', color: dependencyDidUpdateColor),
            new LifecycleHook(title: 'build', color: dependencyDidUpdateColor),
            new LifecycleHook(
                title: 'didUpdateWidget', color: dependencyDidUpdateColor),
            new LifecycleHook(title: 'build', color: dependencyDidUpdateColor),
            new LifecycleHook(
                title: 'deactivate', color: dependencyDidUpdateColor),
            new LifecycleHook(
                title: 'dispose', color: dependencyDidUpdateColor),
          ],
        )),
      ),
    );
  }
}

class Mounted extends StatelessWidget {
  final String title;
  final Color color;

  const Mounted({Key key, this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: new Text(
        title,
        style: Theme.of(context).textTheme.headline,
        textAlign: TextAlign.center,
      ),
      width: 140.0,
      height: 50.0,
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      decoration: new BoxDecoration(
        color: color,
        border: new Border.all(color: Colors.black, width: 1.0),
        borderRadius: new BorderRadius.circular(5.0),
      ),
    );
  }
}

class LifecycleHook extends StatelessWidget {
  final String title;
  final Color color;

  const LifecycleHook({Key key, this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: new Text(
        title,
        style: Theme.of(context).textTheme.headline,
        textAlign: TextAlign.center,
      ),
      width: 300.0,
      height: 50.0,
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      decoration: new BoxDecoration(
        color: color,
        border: new Border.all(color: Colors.black, width: 1.0),
        borderRadius: new BorderRadius.circular(5.0),
      ),
    );
  }
}
