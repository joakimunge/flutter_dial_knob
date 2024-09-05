library knob;

import 'dart:math';

import 'package:flutter/material.dart';

/// A customizable knob widget for Flutter.
///
/// Example usage:
/// ```dart
/// Knob(
///   value: 0.5,
///   onChanged: (newValue) {
///     print('New value: $newValue');
///   },
///   min: 0,
///   max: 1,
///   size: 72,
///   trackColor: Colors.grey,
///   levelColor: Colors.blue,
///   knobColor: Colors.white,
///   indicatorColor: Colors.red,
/// )
/// ```
class Knob extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final double size;
  final Widget? child;
  final Color? trackColor;
  final Color? levelColorStart;
  final Color? levelColorEnd;
  final Color? levelColor;
  final Color? knobColor;
  final Color? indicatorColor;

  const Knob({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 1,
    this.size = 72,
    this.child,
    this.trackColor,
    this.levelColorStart,
    this.levelColorEnd,
    this.levelColor,
    this.knobColor,
    this.indicatorColor,
  });

  @override
  State<Knob> createState() => KnobState();
}

class KnobState extends State<Knob> {
  double _currentValue = 0;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy.abs() > details.delta.dx.abs()) {
      final dy = details.delta.dy;
      final newValue = _currentValue - dy * (widget.max - widget.min) / 100;
      setState(() {
        _currentValue = newValue <= widget.min
            ? widget.min
            : newValue.clamp(widget.min, widget.max);
      });
      widget.onChanged(_currentValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      child: CustomPaint(
        size: Size(widget.size, widget.size),
        painter: _KnobPainter(
          value: _currentValue,
          min: widget.min,
          max: widget.max,
          trackColor: widget.trackColor ??
              Theme.of(context).colorScheme.onSurfaceVariant,
          levelColorStart: widget.levelColorStart,
          levelColorEnd: widget.levelColorEnd,
          levelColor: widget.levelColor ?? Colors.blue,
          knobColor: widget.knobColor ??
              Theme.of(context).colorScheme.surfaceContainer,
          indicatorColor: widget.indicatorColor ??
              Theme.of(context).colorScheme.inverseSurface,
        ),
      ),
    );
  }
}

class _KnobPainter extends CustomPainter {
  final double value;
  final double min;
  final double max;
  final Color trackColor;
  final Color? levelColorStart;
  final Color? levelColorEnd;
  final Color levelColor;
  final Color knobColor;
  final Color indicatorColor;

  _KnobPainter({
    required this.value,
    required this.min,
    required this.max,
    required this.trackColor,
    this.levelColorStart,
    this.levelColorEnd,
    required this.levelColor,
    required this.knobColor,
    required this.indicatorColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final angle = _valueToAngle(value, min, max);

    _drawTrack(canvas, center, radius);
    _drawLevel(canvas, center, radius, angle);
    _drawKnob(canvas, center, radius);
    _drawIndicator(canvas, center, radius, angle);
  }

  /// Draws the track arc of the knob.
  void _drawTrack(Canvas canvas, Offset center, double radius) {
    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi / 2 + pi / 4,
      pi * 1.5,
      false,
      trackPaint,
    );
  }

  /// Draws the level arc of the knob.
  void _drawLevel(Canvas canvas, Offset center, double radius, double angle) {
    Paint levelPaint;

    if (levelColorStart != null && levelColorEnd != null) {
      final gradient = LinearGradient(
        colors: [levelColorStart!, levelColorEnd!],
      );
      final rect = Rect.fromCircle(center: center, radius: radius);
      levelPaint = Paint()
        ..shader = gradient.createShader(rect)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4
        ..strokeCap = StrokeCap.round;
    } else {
      levelPaint = Paint()
        ..color = levelColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4
        ..strokeCap = StrokeCap.round;
    }

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi / 2 + pi / 4,
      angle - (pi / 2 + pi / 4),
      false,
      levelPaint,
    );
  }

  /// Draws the knob circle.
  void _drawKnob(Canvas canvas, Offset center, double radius) {
    final knobPaint = Paint()
      ..color = knobColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius - 6, knobPaint);
  }

  /// Draws the indicator circle on the knob.
  void _drawIndicator(
      Canvas canvas, Offset center, double radius, double angle) {
    final indicatorPaint = Paint()
      ..color = indicatorColor
      ..style = PaintingStyle.fill;

    final knobPosition = Offset(
      center.dx + (radius - 14) * cos(angle),
      center.dy + (radius - 14) * sin(angle),
    );

    canvas.drawCircle(knobPosition, 4, indicatorPaint);
  }

  /// Converts the knob value to an angle for drawing the arc.
  double _valueToAngle(double value, double min, double max) {
    return 2 * pi * ((value - min) / (max - min)) * (3 / 4) + pi / 2 + pi / 4;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
