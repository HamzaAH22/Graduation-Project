import 'package:faz3a_application/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType)
    {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
      );
    });
  }
}


