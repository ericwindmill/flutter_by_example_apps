import 'package:firebase_auth/firebase_auth.dart';

class AppState {
  bool isLoading;
  FirebaseUser user;

  AppState({
    this.isLoading = false,
    this.user,
  });

  factory AppState.loading() => new AppState(isLoading: true);

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, user: ${user?.displayName ?? 'null'}}';
  }
}
