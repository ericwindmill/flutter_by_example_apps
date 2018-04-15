import 'package:firebase_auth/firebase_auth.dart';              //new

class AppState {
  final int count;
  final bool isLoading;
  final FirebaseUser currentUser;                               //new

  AppState({
    this.count = 0,
    this.isLoading = false,
    this.currentUser,                                           //new
  });

  factory AppState.loading() => new AppState(isLoading: true);

  AppState copyWith({int count, bool isLoading}) {
    return new AppState(
      count: count ?? this.count,
      isLoading: isLoading ?? this.isLoading,
      currentUser: currentUser ?? this.currentUser,             // new
    );
  }

  @override
  int get hashCode =>
      isLoading.hashCode ^
      count.hashCode ^
      currentUser.hashCode;


  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              isLoading == other.isLoading &&
              count == other.count &&
              currentUser == other.currentUser;


  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, count: $count, currentUser: $currentUser}';
  }
}