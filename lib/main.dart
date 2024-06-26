import 'package:facebook_clon/Screen/Home_Screen.dart';
import 'package:facebook_clon/Screen/nav_screen.dart';
import 'package:facebook_clon/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clon/widgets/widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Palette.scaffold,
      ),
      home: NavScreen(),
    );
  }
}
