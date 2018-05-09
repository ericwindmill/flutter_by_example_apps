import 'package:flutter/material.dart';
import '../app_state_container.dart';
import '../models/app_state.dart';
import 'auth_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  AppState appState;

  Widget get _pageToDisplay {
    if (appState.isLoading) {
      return _loadingView;
    } else if (!appState.isLoading && appState.user == null) {
      return new AuthScreen();
    } else {
      return _homeView;
    }
  }

  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  Widget get _homeView {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            'Logged In:',
            style: new TextStyle(
              fontSize: 18.0,
            ),
          ),
          new Text(
            appState.user.displayName,
            style: new TextStyle(fontSize: 24.0),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var container = AppStateContainer.of(context);
    appState = container.state;
    Widget body = _pageToDisplay;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Inherited Test'),
      ),
      body: body,
    );
  }
}
