import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class InheritedStateContainer extends InheritedWidget {
  const InheritedStateContainer({
    Key key,
    @required this.title,
    @required Widget child,
  }) : super(key: key, child: child);

  final String title;

  static InheritedStateContainer of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(InheritedStateContainer);
  }

  @override
  bool updateShouldNotify(InheritedStateContainer old) => title != old.title;
}