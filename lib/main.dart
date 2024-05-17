import 'package:aspen_project/screens/home/home_screen.dart';
import 'package:aspen_project/screens/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.high,
    playSound: true,
    enableVibration: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  if (message.notification != null) {
    flutterLocalNotificationsPlugin.show(
        message.hashCode,
        message.notification!.title ?? '',
        message.notification!.body ?? '',
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            color: Colors.lightBlue,
            playSound: true,
            enableVibration: true,
            icon: '@mipmap/ic_launcher',
            styleInformation: const BigTextStyleInformation('AAAAA'),
          ),
        ));
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //String? token = await FirebaseMessaging.instance.getToken();

  AndroidInitializationSettings initializationSettingsAndroid =
      const AndroidInitializationSettings('@mipmap/ic_launcher');
  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings();
  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(
    const MyApp(),
  );
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initFirebaseMassage(); // thread stream waiting notification
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            boldText: false,
            textScaler: const TextScaler.linear(1.0),
          ),
          child: child!,
        ),
        title: "Aspen project",
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        theme:lightMode,
        darkTheme: darkMode,

      );
    });


  }

  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    if (kDebugMode) {
      print(
          'A bg message just showed up :  ${message.messageId} ${message.notification!.title}');
    }
    flutterLocalNotificationsPlugin.show(
        message.hashCode,
        message.notification!.title ?? '',
        message.notification!.body ?? '',
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            color: Colors.lightBlue,
            playSound: true,
            enableVibration: true,
            icon: '@mipmap/ic_launcher',
            styleInformation: const BigTextStyleInformation('AAAAA'),
          ),
        ));
  }

  void _initFirebaseMassage() {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null &&
          message.notification!.title != null &&
          message.notification!.body != null) {
        RemoteNotification notification = message.notification!;
        if (notification.android != null) {
          flutterLocalNotificationsPlugin.show(
              message.hashCode,
              message.notification!.title ?? '',
              message.notification!.body ?? '',
              NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  color: Colors.indigoAccent,
                  playSound: true,
                  enableVibration: true,
                  icon: '@mipmap/ic_launcher',
                  styleInformation: const BigTextStyleInformation('AAAAA'),
                ),
              ));
        }
        if (notification.apple != null) {
          flutterLocalNotificationsPlugin.show(
              message.hashCode,
              message.notification!.title ?? '',
              message.notification!.body ?? '',
              NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  color: Colors.lightBlue,
                  playSound: true,
                  enableVibration: true,
                  icon: '@mipmap/ic_launcher',
                  styleInformation: const BigTextStyleInformation('AAAAA'),
                ),
              ));
        }
      }
    });
  }
}
