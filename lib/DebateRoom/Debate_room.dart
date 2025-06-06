import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'DebateController.dart';

class debate_room extends StatelessWidget {
  final DebateController controller = Get.put(DebateController());
  debate_room({super.key});

  @override
  build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF81D4FA),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Debate Room", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.lightBlue,
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.debateRooms.length,
          itemBuilder: (context, index) {
            final room = controller.debateRooms[index];
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Topic",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                room["status"] == "Live"
                                    ? Icons.live_tv
                                    : Icons.schedule,
                                color: room["status"] == "Live"
                                    ? Colors.red
                                    : Colors.black,
                              ),
                              SizedBox(width: 2),
                              Text(room["status"]),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.5),
                        child: Text(
                          room["title"],
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.people_alt_sharp),
                          Text("${room["participants"].toString()}/50"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateRoomDialog(context),
        child: Icon(Icons.add, size: 35, color: Color(0xFF2962FF)),
      ),
    );
  }

  void _showCreateRoomDialog(BuildContext context) {
    Get.defaultDialog(
      title: "Create Debate Room",
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: controller.title,
              decoration: InputDecoration(
                // labelText: "Topic",
                hintText: "Enter Debate Topic",
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (controller.title.text.isNotEmpty) {
                  controller.addDebateRoom(controller.title.text);
                  controller.title.clear();
                  Get.back();
                }
              },
              child: Text("Create", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
