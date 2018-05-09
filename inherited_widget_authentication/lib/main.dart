
import 'package:flutter/material.dart';
import 'app.dart';
import 'app_state_container.dart';

void main() {
  runApp(new AppStateContainer(
    child: new AppRootWidget(),
  ));
}
