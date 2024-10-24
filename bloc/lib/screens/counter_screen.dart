// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:bloc_example/blocs/counter/counter_bloc.dart';
// import 'package:bloc_example/blocs/counter/counter_event.dart';
// import 'package:bloc_example/blocs/counter/counter_state.dart';

// class CounterScreen extends StatelessWidget {
//   const CounterScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Counter BLoC and Testing Example"),
//       ),
//       body: Center(
//         child: BlocBuilder<CounterBloc, CounterState>(
//           builder: (context, state) {
//             final stopwatch = Stopwatch()..start();
//             Widget result;
//             if (state.status == CounterStatus.initial || state.status == CounterStatus.loading) {
//               result = const CircularProgressIndicator();
//             } else if (state.status == CounterStatus.success) {
//               result = Text(
//                 'Counter Value: ${state.counter.value}',
//               );
//             } else {
//               result = const Text(
//                 'Something went wrong!',
//               );
//             }
//             stopwatch.stop();
//             print('Build time for CounterScreen: ${stopwatch.elapsedMicroseconds} ms');
//             return result;
//           },
//         ),
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             heroTag: "counter_add",
//             onPressed: () {
//               context.read<CounterBloc>().add(
//                     IncrementEvent(),
//                   );
//             },
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(height: 8),
//           FloatingActionButton(
//             key: const Key('incrementButton'),
//             onPressed: () {
//               context.read<CounterBloc>().add(
//                     DecrementEvent(),
//                   );
//             },
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }
