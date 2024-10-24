import 'package:bloc/bloc.dart';

import '../../models/counter_model.dart';

import 'counter_event.dart';
import 'counter_state.dart';

// class CounterBloc extends Bloc<CounterEvent, CounterState> {
//   CounterBloc() : super(const CounterState()) {
//     on<CounterStarted>(_onStarted);
//     on<IncrementEvent>(_onIncrementEvent);
//     on<DecrementEvent>(_onDecrementEvent);
//   }

//   void _onStarted(CounterStarted event, Emitter<CounterState> emit) {
//     if (state.status == CounterStatus.success) return;
//     Counter counter = const Counter(value: 0);
//     emit(CounterState(counter: counter, status: CounterStatus.success));
//   }

//   void _onIncrementEvent(IncrementEvent event, Emitter<CounterState> emit) {
//     int value = state.counter.value + 1;
//     Counter counter = state.counter.copyWith(value);
//     emit(state.copyWith(counter: counter, status: CounterStatus.success));
//   }

//   void _onDecrementEvent(DecrementEvent event, Emitter<CounterState> emit) {
//     int value = state.counter.value - 1;
//     Counter counter = state.counter.copyWith(value);
//     emit(state.copyWith(counter: counter, status: CounterStatus.success));
//   }
// }

// class NotesBloc extends Bloc<NotesEvent, NotesState> {
//   final List<String> _notes = ["Header 1", "Header 2", "Header 3"];

//   NotesBloc() : super(NotesLoading()) {
//     on<AddNote>((event, emit) {
//       _notes.add(event.note);
//       emit(NotesLoaded(_notes));
//     });

//     on<EditNote>((event, emit) {
//       _notes[event.index] = event.newNote;
//       emit(NotesLoaded(_notes));
//     });

//     on<DeleteNote>((event, emit) {
//       _notes.removeAt(event.index);
//       emit(NotesLoaded(_notes));
//     });
//   }
// }
