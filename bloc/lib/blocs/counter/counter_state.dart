import 'package:bloc_example/models/counter_model.dart';
import 'package:equatable/equatable.dart';

// enum CounterStatus { initial, loading, success, error }

// class CounterState extends Equatable {
//   final Counter counter;
//   final CounterStatus status;

//   const CounterState({
//     this.counter = const Counter(value: 0),
//     this.status = CounterStatus.initial,
//   });

//   CounterState copyWith({
//     Counter? counter,
//     CounterStatus? status,
//   }) {
//     return CounterState(
//       counter: counter ?? this.counter,
//       status: status ?? this.status,
//     );
//   }

//   factory CounterState.fromJson(Map<String, dynamic> json) {
//     return CounterState(
//       counter: Counter.fromJson(json["counter"]),
//       status: CounterStatus.values.firstWhere(
//         (element) => element.name.toString() == json["status"],
//       ),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "counter": counter.toJson(),
//       "status": status.name,
//     };
//   }

//   @override
//   List<Object> get props => [counter, status];
// }

enum NoteStatus { initial, loading, success, error, edited, deleted }

abstract class NotesState extends Equatable {
  const NotesState();
  @override
  List<Object> get props => [];
}

class NotesLoading extends NotesState {}

class NotesLoaded extends NotesState {
  final List<String> notes;
  final NoteStatus? status;

  const NotesLoaded({
    this.notes = const [],
    this.status = NoteStatus.initial,
  });

  @override
  List<Object> get props => [notes];
}

class NoteDeleted extends NotesState {
  final List<String> notes;
  final NoteStatus? status;

  const NoteDeleted({
    this.notes = const [],
    this.status = NoteStatus.initial,
  });

  @override
  List<Object> get props => [notes];
}
