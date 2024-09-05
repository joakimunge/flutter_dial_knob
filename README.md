# Knob

A customizable knob widget for Flutter.

## Features

- Customizable colors for track, level, knob, and indicator
- Gradient support for level indicator
- Adjustable size

## Installation

Add this to your `pubspec.yaml` file:

```yaml
dependencies:
  knob: ^0.0.1
```

Then run:

```sh
flutter pub get
```

or

```
$ flutter pub add knob
```

## Usage

Import the package in your Dart file:

```dart
import 'package:knob/knob.dart';
```

Use the `Knob` widget in your Flutter app:

```dart
import 'package:flutter/material.dart';
import 'package:knob/knob.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Knob Example'),
        ),
        body: Center(
          child: Knob(
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
Knob(
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
