import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:me_suite/actions/counter_actions.dart';
import 'package:me_suite/models/app_state.dart';
import 'package:redux/redux.dart';

// This is just another stateless widget.
class IncreaseCountButton extends StatelessWidget {
  IncreaseCountButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, VoidCallback>(
      converter: (Store<AppState> store) {
        return () {
          store.dispatch(new IncrementCountAction());
        };
      },
      builder: (BuildContext context, VoidCallback increase) {
        return new FloatingActionButton(
          onPressed: increase,
          child: new Icon(Icons.add),
        );
      },
    );
  }
}