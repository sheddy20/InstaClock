import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    //make the request call
    Response response =
        await get("http://worldtimeapi.org/api/timezone/Africa/Lagos");
    Map data = jsonDecode(response.body);
    print(data);

    //get properties from data
    String datetime = data["datetime"];
    String offset = data["utc_offset"].substring(1, 3);
    // print(datetime);
    // print(offset);

    //create a datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.menu, color: Colors.black),
        title: Text(
          "InstaClock",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Text("Loading Screen"),
    );
  }
}
