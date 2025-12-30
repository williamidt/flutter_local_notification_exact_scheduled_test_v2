import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings("@mipmap/ic_launcher");

    const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        );

    await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: _onNotificationTap,
    );
  }

  void _onNotificationTap(NotificationResponse response){
    // you can navigate to any screen when notification clicked
    print("Notification Clicked: ${response.payload}");
  }

  Future<void> showInstantNotification() async {
    const AndroidNotificationDetails androidPlataformChannelSpecifies = AndroidNotificationDetails(
      'Instant_channel',
      'Instant Notifications',
      channelDescription: 'Channel for instant notification',
      importance: Importance.max,
      priority: Priority.high
    );

    const NotificationDetails plataformChannelSpecifies = NotificationDetails(
      android: androidPlataformChannelSpecifies
    );

    // you can customize title and notification of notification
    // and you can also make it dynamic
    await flutterLocalNotificationsPlugin.show(
        0,
        'Title of Notification',
        'Description of Notification',  plataformChannelSpecifies,
        payload: 'instant',

    );
  }


  scheduleNotification(DateTime scheduledDateTime) async {
    const AndroidNotificationDetails androidPlataformChannelSpecifies = AndroidNotificationDetails(
        'Instant_channel',
        'Instant Notifications',
        channelDescription: 'Channel for instant notification',
        importance: Importance.max,
        priority: Priority.high
    );

    const NotificationDetails plataformChannelSpecifies = NotificationDetails(
        android: androidPlataformChannelSpecifies
    );

    // you can customize title and notification of notification
    // and you can also make it dynamic
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Title of Notification',
        'Description of Notification',
      tz.TZDateTime.from(scheduledDateTime, tz.local),
      plataformChannelSpecifies,
      payload: 'scheduled ',
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle
    );
  }
}