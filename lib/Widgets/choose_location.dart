import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void getData() async {
    //Simulate a network request for username,
    String userName = await Future.delayed(Duration(seconds: 3), () {
      return "My Name Is Shedrack";
    });

    //Simulate network request to get username bio.
    String bio = await Future.delayed(Duration(seconds: 2), () {
      return "Vegan, village, riverpod, provider";
    });

    print("$userName - $bio");
  }

  @override
  void initState() {
    super.initState();
    print("Siberian Husky");
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Choose A Location"),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Text("Getx State Management"),
    );
  }
}
