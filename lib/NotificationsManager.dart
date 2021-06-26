

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationsManager {

  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance = PushNotificationsManager._();

  static AndroidNotificationChannel channel;

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  static bool _initialized = false;

  static Future<void> init() async {
    if (!_initialized) {
      // For iOS request permission first.
      await Firebase.initializeApp();
      channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        'This channel is used for important notifications.', // description
        importance: Importance.high,
      );

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
      flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      await FirebaseMessaging.instance.requestPermission();
      String token = await FirebaseMessaging.instance.getToken();
      print("FirebaseMessaging token: $token");



      _initialized = true;
    }
  }
}