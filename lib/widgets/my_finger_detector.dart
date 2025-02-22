import 'package:flutter/material.dart';
import 'package:shortcad/widgets/my_list.dart';
import 'package:multi_finger_gesture_detector/multi_finger_gesture_detector.dart';

class MyFingerDetector extends StatefulWidget {
  const MyFingerDetector({super.key});

  @override
  _MyFingerDetectorState createState() => _MyFingerDetectorState();
}

class _MyFingerDetectorState extends State<MyFingerDetector> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: MultiFingerGestureDetector(
            onGestureStart: (gestureType, offset) {
              print('');
            },
            onGestureUpdate: (gestureType, offset) {
              print('');
            },
            onGestureEnd: (gestureType, offset) {
              print(gestureType.toString());
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.maxFinite,
              child: ColoredBox(
                color: Colors.blue.shade200,
              ),
            )));
  }
}
