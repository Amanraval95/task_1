import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_1/DebateRoom/Debate_room.dart';

void main() {
  runApp(task_1());
}

class task_1 extends StatelessWidget {
  task_1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: debate_room(),
    );
  }
}
