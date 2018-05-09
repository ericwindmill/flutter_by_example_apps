import 'package:firebase_auth/firebase_auth.dart';
import 'package:me_suite/actions/auth_actions.dart';
import 'package:redux/redux.dart';

final authReducer = combineReducers<FirebaseUser>([
  new TypedReducer<FirebaseUser, LogInSuccessful>(_logIn),
  new TypedReducer<FirebaseUser, LogOutSuccessful>(_logOut),
]);

FirebaseUser _logIn(FirebaseUser user, action) {
  return action.user;
}

Null _logOut(FirebaseUser user, action) {
  return null;
}