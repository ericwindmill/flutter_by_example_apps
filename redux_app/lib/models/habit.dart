import 'package:flutter/foundation.dart';

class Habit {
  final String habit;
  final String notes;
  List<String> tags;
  final bool active;
  final bool completeToday;
  final DateTime nextDueDate;
  final String repeat;

  Habit({
    @required this.habit,
    this.notes = "",
    this.active = true,
    this.completeToday = false,
    this.tags,
    this.nextDueDate,
    this.repeat = 'daily',
  });

  Habit copyWith(
      {habit, notes, active, completeToday, tags, nextDueDate, repeat}) {
    return new Habit(
      habit: habit ?? this.habit,
      notes: notes ?? this.notes,
      active: active ?? this.active,
      completeToday: completeToday ?? this.completeToday,
      tags: tags ?? this.tags,
      nextDueDate: nextDueDate ?? this.nextDueDate,
      repeat: repeat ?? this.repeat,
    );
  }
}
