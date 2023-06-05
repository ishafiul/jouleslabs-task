import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:todo/comon/utils/extensions.dart';
import 'package:todo/data/models/todo.dart';
import 'package:todo/data/object_box.dart';

class OverlayWidget extends HookWidget {
  const OverlayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Future<Todo?> overlayTodoData = Future<Todo?>(() async {
      final objectBox = await TodoObjectBox.create();
      final data = objectBox.getOverlayTodo();
      if (data != null) {
        objectBox.updateOverlayTodo(data: data);
        return data;
      }
      return null;
    });
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: overlayTodoData,
        builder: (context, snapshot) => Container(
          decoration: const BoxDecoration(color: Color(0xFFE5F6FF), borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  snapshot.data?.title ?? '',
                  style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Amet minim mollit non deserunt  veniam consequat sunt nostrud amet?",
                  style: TextStyle(fontSize: 14, color: Color(0xFF383838), height: 1.4),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await FlutterOverlayWindow.closeOverlay();
                        },
                        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.redAccent.shade100)),
                        child: Text('No'.toUpperCase()),
                      ),
                      ElevatedButton(onPressed: () {}, style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green.shade400)), child: Text('yes'.toUpperCase()))
                    ],
                  ),
                )
              ].withSpaceBetween(height: 20),
            ),
          ),
        ),
      ),
    );
  }
}
