import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'screens/first_screen.dart';


void main() {
  // dart code
  // design
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
        title: "Aspen project",
        debugShowCheckedModeBanner: false,
        home: const FirstScreen(),
        theme: ThemeData(
          primaryColor: Colors.red,
        ),
      );
    });
  }
}
