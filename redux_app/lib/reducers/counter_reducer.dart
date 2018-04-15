import 'package:me_suite/actions/counter_actions.dart';
import 'package:redux/redux.dart';

final counterReducer = combineTypedReducers<int>([
  new ReducerBinding<int, IncrementCountAction>(_incrementCount),
]);

int _incrementCount(int currentCount, action) {
  return currentCount + 1;
}
