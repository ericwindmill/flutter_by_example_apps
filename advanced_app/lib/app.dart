import 'package:advanced_app/pages/auth_screen.dart';
import 'package:advanced_app/pages/home_screen.dart';
import 'package:flutter/material.dart';


class AppRootWidget extends StatefulWidget {
  @override
  AppRootWidgetState createState() => new AppRootWidgetState();
}

class AppRootWidgetState extends State<AppRootWidget> {
  ThemeData get _themeData => new ThemeData(
        primaryColor: Colors.cyan,
        accentColor: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[300],
      );

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Inherited',
      theme: _themeData,
      routes: {
        '/': (BuildContext context) => new HomeScreen(),
        '/auth': (BuildContext context) => new AuthScreen(),
      },
    );
  }
}
