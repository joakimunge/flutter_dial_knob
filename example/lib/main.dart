import 'package:flutter/material.dart';
import 'package:flutter_dial_knob/flutter_dial_knob.dart';

void main() {
  runApp(const DialKnobExampleApp());
}

class DialKnobExampleApp extends StatelessWidget {
  const DialKnobExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dial Knob Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DialKnobExamplePage(),
    );
  }
}

class DialKnobExamplePage extends StatefulWidget {
  const DialKnobExamplePage({super.key});

  @override
  State<DialKnobExamplePage> createState() => DialKnobExamplePageState();
}

class DialKnobExamplePageState extends State<DialKnobExamplePage> {
  double _knobOneValue = 0.5;
  double _knobTwoValue = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dial Knob Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(72),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DialKnob(
                    value: _knobOneValue,
                    onChanged: (newValue) {
                      setState(() {
                        _knobOneValue = newValue;
                      });
                    },
                    min: 0,
                    max: 1,
                    size: 72,
                    trackColor: const Color.fromARGB(255, 61, 61, 61),
                    levelColorStart: Colors.blue,
                    levelColorEnd: const Color.fromARGB(255, 19, 255, 251),
                    knobColor: const Color.fromARGB(255, 58, 58, 58),
                    indicatorColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _knobOneValue.toStringAsFixed(2),
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DialKnob(
                    value: _knobTwoValue,
                    onChanged: (newValue) {
                      setState(() {
                        _knobTwoValue = newValue;
                      });
                    },
                    min: 0,
                    max: 100,
                    size: 72,
                    trackColor: const Color.fromARGB(255, 61, 61, 61),
                    levelColorStart: const Color.fromARGB(255, 209, 10, 10),
                    levelColorEnd: const Color.fromARGB(255, 255, 183, 0),
                    knobColor: const Color.fromARGB(255, 58, 58, 58),
                    indicatorColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _knobTwoValue.toStringAsFixed(2),
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
