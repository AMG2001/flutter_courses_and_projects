import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {
  Notifications._privateConstructor();

  static final Notifications _instance = Notifications._privateConstructor();

  static Notifications get instance => _instance;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    // Initialize the plugin with an AndroidInitializationSettings object
    AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,

      /**
   * onSelectNotification is the option that if the user touched on the notification .
   */
      // onSelectNotification: onSelectNotification
    );
    // initialize the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);
  }

  Future<void> showNotification(
      {required String notif_title, required String notif_subTitle}) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('your channel id', 'your channel name',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false);
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
        0, notif_title, notif_subTitle, platformChannelSpecifics,
        payload: 'item x');
  }

  Future<void> onSelectNotification(String? payload) async {
    if (payload != null) {
      print('notification payload: $payload');
    }
  }

  Future<void> onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {}
}
