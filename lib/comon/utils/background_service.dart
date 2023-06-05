import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:todo/data/object_box.dart';
import 'package:todo/main.dart';

Future<void> initBackgroundServices() async {
  final bgService = FlutterBackgroundService();

  await bgService.configure(
    iosConfiguration: IosConfiguration(),
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      isForegroundMode: true,
    ),
  );
  await bgService.startService();
}

@pragma('vm:entry-point')
Future<void> onStart(ServiceInstance service) async {
  final objectBox = await TodoObjectBox.create();

  WidgetsFlutterBinding.ensureInitialized();
  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }
  service.on('stopService').listen((event) {
    service.stopSelf();
  });
  Timer.periodic(const Duration(seconds: 1), (timer) async {
    final taskData = await objectBox.getNotifyTodoNow();
    if (taskData != null) {
      FlutterOverlayWindow.showOverlay(
        height: 600,
        width: 600
      );
      flutterLocalNotificationsPlugin.show(
        888,
        'You have a task to do!',
        taskData.title,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'my_foreground',
            'MY FOREGROUND SERVICE',
            icon: 'app_icon',
            ongoing: true,
          ),
        ),
      );
    }
  });
}
