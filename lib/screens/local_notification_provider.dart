import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

  late Timer _timer;




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
  

      _startTimer();
    } 

      void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      mostrarNotificacion();
    });
  }


Future<void> mostrarNotificacion() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'channel id',
    'channel name',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
    sound: RawResourceAndroidNotificationSound('mi_sonido'),
    playSound: true,
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
    payload: 'Custom_Sound',
    
      );
}