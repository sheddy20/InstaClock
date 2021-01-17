import 'package:InstaClock/services/world_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Berlin", flag: "nigeria.png", url: "Europe/Berlin");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/homePage", arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   leading: Icon(FontAwesomeIcons.clock, color: Colors.black),
      //   title: Text(
      //     "InstaClock",
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   centerTitle: true,
      // ),
      body: Center(
        child: SpinKitWave(
          color: Colors.green,
          size: 60.0,
        ),
      ),
    );
  }
}
