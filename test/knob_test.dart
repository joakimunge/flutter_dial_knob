import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:knob/knob.dart';

void main() {
  testWidgets('Knob widget has correct initial value',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Knob(
            value: 0.5,
            onChanged: (value) {},
          ),
        ),
      ),
    );

    final knobFinder = find.byType(Knob);
    expect(knobFinder, findsOneWidget);
  });

  testWidgets('Knob calls onChanged after drag down gesture',
      (WidgetTester tester) async {
    double knobValue = 0.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Knob(
            value: knobValue,
            min: 0,
            max: 1,
            onChanged: (value) {
              knobValue = value;
            },
          ),
        ),
      ),
    );

    final knobFinder = find.byType(Knob);

    expect(knobFinder, findsOneWidget);
    expect(knobValue, 0.0);

    await tester.drag(knobFinder, const Offset(0, -200));

    await tester.pumpAndSettle();

    expect(knobValue, isNot(0.0));
  });
}
