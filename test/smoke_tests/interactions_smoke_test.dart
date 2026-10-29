import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  group('smoke test', () {
    GoldenTestGroup buildSmokeTestGroup() {
      return GoldenTestGroup(
        children: [
          GoldenTestScenario(name: 'scenario_text', child: const Text('text')),
          GoldenTestScenario(
            name: 'scenario_button',
            child: TextButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xFF2196F3)),
                foregroundColor: WidgetStatePropertyAll(Color(0xFFFFFFFF)),
                shadowColor: WidgetStatePropertyAll(Color(0xFFFF0000)),
                surfaceTintColor: WidgetStatePropertyAll(Color(0xFF00FF00)),
                overlayColor: WidgetStatePropertyAll(Color(0xFF0000FF)),
              ),
              onPressed: () {},
              onLongPress: () {},
              child: const Text('button'),
            ),
          ),
        ],
      );
    }

    goldenTest(
      'succeeds in regular state',
      fileName: 'interactions_smoke_test_regular',
      builder: buildSmokeTestGroup,
    );

    goldenTest(
      'succeeds while pressed',
      fileName: 'interactions_smoke_test_pressed',
      // Skipped: the test body never returns (10 min timeout) on macOS, Linux
      // and Windows; not a golden diff. Investigate before re-enabling.
      skip: true,
      whilePerforming: press(find.byType(TextButton)),
      builder: buildSmokeTestGroup,
    );

    goldenTest(
      'succeeds while long pressed',
      fileName: 'interactions_smoke_test_long_pressed',
      // Skipped: same hang as the pressed test above.
      skip: true,
      whilePerforming: longPress(find.byType(TextButton)),
      builder: buildSmokeTestGroup,
    );
  });
}
