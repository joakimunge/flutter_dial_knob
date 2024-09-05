# Knob

A customizable dial knob widget for Flutter.

## Features

- Dart 3 Compatible
- Customizable colors for track, level, knob, and indicator
- Gradient support for level indicator
- Adjustable size

## Installation

Add this to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_dial_knob: ^0.0.1
```

Then run:

```sh
flutter pub get
```

or

```
$ flutter pub add flutter_dial_knob
```

## Usage

Import the package in your Dart file:

```dart
import 'package:flutter_dial_knob/flutter_dial_knob.dart';
```

Use the `DialKnob` widget in your Flutter app:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_dial_knob/flutter_dial_knob.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dial Knob Example'),
        ),
        body: Center(
          child: DialKnob(
            value: 0.5,
            onChanged: (newValue) {
              print(newValue);
            },
            min: 0,
            max: 1,
            size: 100,
            trackColor: Colors.grey,
            levelColorStart: Colors.green,
            levelColorEnd: Colors.red,
            knobColor: Colors.blue,
            indicatorColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
```

## Customizable Properties

- `value`: The current value of the knob.
- `onChanged`: Callback when the value changes.
- `min`: Minimum value (default is 0).
- `max`: Maximum value (default is 1).
- `size`: Size of the knob (default is 72).
- `child`: Optional child widget.
- `trackColor`: Color of the track.
- `levelColorStart`: Start color of the level gradient.
- `levelColorEnd`: End color of the level gradient.
- `levelColor`: Solid color of the level.
- `knobColor`: Color of the knob.
- `indicatorColor`: Color of the indicator.

## Example

```dart
DialKnob(
  value: 0.5,
  onChanged: (newValue) {
    print(newValue);
  },
  min: 0,
  max: 1,
  size: 100,
  trackColor: Colors.grey,
  levelColorStart: Colors.green,
  levelColorEnd: Colors.red,
  knobColor: Colors.blue,
  indicatorColor: Colors.white,
)
```

## License

MIT License. See LICENSE for more information.
