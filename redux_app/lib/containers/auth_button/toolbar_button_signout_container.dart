import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:me_suite/actions/auth_actions.dart';
import 'package:me_suite/models/app_state.dart';
import 'package:me_suite/pages/auth_page.dart';
import 'package:redux/redux.dart';

class ToolbarLogOutButton extends StatelessWidget {
  ToolbarLogOutButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) {
        return new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new InkWell(
            child:
            new Text('Log Out'),
            onTap: () => vm.onPressedCallback(context),
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final Icon icon;
  final Function onPressedCallback;

  _ViewModel({this.onPressedCallback, this.icon});

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(
        icon: new Icon(Icons.close),
        onPressedCallback: (context) {
          store.dispatch(new LogOut());
          var route = new MaterialPageRoute(
              settings: new RouteSettings(name: '/login'),
              builder: (context) => new AuthPage());
          Navigator
              .of(context)
              .pushAndRemoveUntil(route, ModalRoute.withName('/'));
        });
  }
}
