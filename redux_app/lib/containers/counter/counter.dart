import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:me_suite/models/app_state.dart';
import 'package:redux/redux.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
      // Rather than build a method here, we'll defer this
      // responsibility to the _viewModel.
      converter: _ViewModel.fromStore,
      // Our builder now takes in a _viewModel as a second arg
      builder: (BuildContext context, _ViewModel vm) {
        return new Text(
          // Our _viewModel is 'watching' the count slice of state
          // So this will be re-rendered when that slice of
          // state changes
          vm.count.toString(),
          style: Theme.of(context).textTheme.display1,
        );
      },
    );
  }
}

// This is just a class -- nothing fancy
class _ViewModel {
  // It should take in whatever it is you want to 'watch'
  final int count;

  _ViewModel({
    @required this.count,
  });

  // This is simply a constructor method.
  // This creates a new instance of this _viewModel
  // with the proper data from the Store.
  //
  // This is a very simple example, but it lets our
  // actual counter widget do things like call 'vm.count'
  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(count: store.state.count);
  }
}
