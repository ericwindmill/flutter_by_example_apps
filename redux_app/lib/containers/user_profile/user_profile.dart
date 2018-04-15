// containers/user_profile/user_profile.dart

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:me_suite/models/app_state.dart';
import 'package:redux/redux.dart';

class CurrentUserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This widget will change as the Redux store is updated,
    // So we need to connnect it to the store:
    return new StoreConnector<AppState, _ViewModel>(
        // Build a viewModel, as usual:
        converter: _ViewModel.fromStore,
        builder: (BuildContext context, _ViewModel vm) {
          // First, check to see if
          if (vm.displayName == null) {
            return new Container();
          } else {
            return new Center(
              child: new Column(
                children: <Widget>[
                  new Text('Now signed in:',
                      style: Theme.of(context).textTheme.display1),
                  new Text(vm.displayName,
                      style: Theme.of(context).textTheme.display2),
                ],
              ),
            );
          }
        });
  }
}

// A very basic viewModel.
class _ViewModel {
  final String displayName;
  final String profileImgUrl;

  _ViewModel({@required this.displayName, @required this.profileImgUrl});

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(
      // We have to use the null aware operator here, so that
      // when there isn't a user, it just fails silently
      displayName: store.state.currentUser?.displayName,
      profileImgUrl: store.state.currentUser?.photoUrl,
    );
  }
}
