import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DebateController extends GetxController {
  TextEditingController title = TextEditingController();

  final debateRooms = <Map<String, dynamic>>[].obs;

  void addDebateRoom(String title) {
    int Participants = Random().nextInt(50) + 1;
    final String status = Random().nextBool() ? "Live" : "Scheduled";

    debateRooms.add({
      'title': title,
      'participants': Participants,
      'status': status,
    });
  }
}
