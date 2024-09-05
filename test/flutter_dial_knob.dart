import 'package:flutter/material.dart';
import 'package:flutter_dial_knob/flutter_dial_knob.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Knob widget has correct initial value',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DialKnob(
            value: 0.5,
            onChanged: (value) {},
          ),
        ),
      ),
    );

    final knobFinder = find.byType(DialKnob);
    expect(knobFinder, findsOneWidget);
  });

  testWidgets('DialKnob calls onChanged after drag down gesture',
      (WidgetTester tester) async {
    double knobValue = 0.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DialKnob(
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

    final knobFinder = find.byType(DialKnob);

    expect(knobFinder, findsOneWidget);
    expect(knobValue, 0.0);

    await tester.drag(knobFinder, const Offset(0, -200));

    await tester.pumpAndSettle();

    expect(knobValue, isNot(0.0));
  });
}
