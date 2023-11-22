import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    Future<void> initNotifications() async {

      const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');
        const DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings();

        const InitializationSettings  initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsDarwin,
        );

        await flutterLocalNotificationsPlugin.initialize(initializationSettings);



    } 


Future<void> mostrarNotificacion() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'channel id',
    'channel name',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
  );
  // Esto es para iOS
  const darwinNotifaicationDetails = DarwinNotificationDetails();


    

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
    0,
    'Hola',
    'Mundo',
    platformChannelSpecifics,
    payload: 'Default_Sound',
  );
}