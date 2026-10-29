import 'dart:async';
import 'dart:io';

import 'package:alchemist/src/golden_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

class TimerButton extends StatelessWidget {
  const TimerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Button'),
      onPressed: () {
        Timer(Duration.zero, () {});
      },
    );
  }
}

void main() {
  group('smoke test', () {
    goldenTest(
      'succeeds after tapping button with timer',
      fileName: 'timer_button_smoke_test',
      // macOS and Windows: the golden matcher receives a Future<Image> and
      // does not match, while the same golden matches on Linux. Run on Linux
      // only until that is fixed.
      skip: !Platform.isLinux,
      pumpBeforeTest: (tester) async {
        await tester.tap(find.byType(TimerButton));
        await tester.pumpAndSettle();
      },
      builder: () => const TimerButton(),
    );
  });
}
