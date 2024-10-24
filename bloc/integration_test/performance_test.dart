import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:bloc_example/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Counter performance test', (WidgetTester tester) async {
    // Start the app.
    await tester.pumpWidget(const MyApp());

    // Find the increment button using its key.
    final incrementButton = find.byKey(const Key('incrementButton'));

    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    List<int> times = [];

    // Start measuring performance.

    for (int i = 0; i < 100; i++) {
      final stopwatch = Stopwatch()..start();

      await tester.tap(incrementButton);
      await tester.pumpAndSettle(); // Wait for animations and UI updates.

      stopwatch.stop();
      times.add(stopwatch.elapsedMilliseconds);
      print('Time taken for increment: ${stopwatch.elapsedMilliseconds} ms');
    }

    // calculate average
    final int sum = times.reduce((a, b) => a + b);
    final double averageTime = sum / times.length;

    // prepare data
    binding.reportData = <String, dynamic>{
      'times': times,
      'averageTime (ms)': averageTime,
    };

    print('Average time taken for 100 increments: $averageTime ms');

    final file = File('integration_test/performance_results.json');
    await file.writeAsString(jsonEncode(binding.reportData));
  });
}
