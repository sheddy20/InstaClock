import 'package:InstaClock/services/world_time.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
      url: "Europe/Berlin",
      location: "Berlin",
      flag: "germany.png",
    ),
    WorldTime(
      url: "Africa/Lagos",
      location: "Calabar",
      flag: "nigeria.png",
    ),
    WorldTime(
      url: "Asia/china",
      location: "Beijing",
      flag: "china.png",
    ),
    WorldTime(
      url: "America/California",
      location: "Portland",
      flag: "america.png",
    ),
    WorldTime(
      url: "Asia/South Korea",
      location: "Seoul",
      flag: "korea.jpg",
    ),
    WorldTime(
      url: "Asia/India",
      location: "New Delhi",
      flag: "india.png",
    ),
    WorldTime(
      url: "Asia/Japan",
      location: "Tokyo",
      flag: "jap.png",
    ),
    WorldTime(
      url: "Africa/South Africa",
      location: "Johanesburg",
      flag: "southAfrica.jpg",
    ),
    WorldTime(
      url: "Africa/Ghana",
      location: "Accra",
      flag: "ghana.png",
    ),
    WorldTime(
      url: "America/Canada",
      location: "Ottawa",
      flag: "canada.jpg",
    ),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDaytime": instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: Text("Choose A Location"),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
        itemCount: locations.length,
        itemBuilder: (_, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].location),
              // subtitle: Text(locations[index].url),
              leading: CircleAvatar(
                backgroundImage: AssetImage("Asset/${locations[index].flag}"),
              ),
              trailing: Icon(Icons.more_vert),
            ),
          );
        },
      ),
    );
  }
}
