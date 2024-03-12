import 'package:aspen_project/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            boldText: false, textScaler: const TextScaler.linear(1.0),
          ),
          child: child!,
        ),
        title: "Aspen project",
        debugShowCheckedModeBanner: false,
        home:  const HomeScreen(),
        theme: ThemeData(
          primaryColor: Colors.red,
          fontFamily: "montserrat",
        ),
      );
    });
  }
}
