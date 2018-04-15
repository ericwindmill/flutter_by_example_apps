import 'dart:async';

import 'package:advanced_app/app.dart';
import 'package:advanced_app/app_state_container.dart';
import 'package:flutter/material.dart';

void main()  {
  runApp(new AppStateContainer(child: new AppRootWidget()));
}
