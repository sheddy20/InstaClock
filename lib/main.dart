import 'package:InstaClock/Widgets/choose_location.dart';
import 'package:InstaClock/Widgets/loading.dart';
import 'package:flutter/material.dart';

import 'Screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "InstaClock",
      initialRoute: "/",
      routes: {
        "/": (context) => Loading(),
        "/homePage": (context) => HomePage(),
        "/location": (context) => ChooseLocation(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}
