import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the UI,
  String time; //This is going to be the time for the location,
  String flag; //the url to an asset flag icon,
  String url; // location url for api endpoint,

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    //make the request call
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // print(data);

      //get properties from data
      String datetime = data["datetime"];
      String offset = data["utc_offset"].substring(1, 3);
      // print(datetime);
      // print(offset);

      //create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property,
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("No such method: $e");
      time = "Could not get the time data...";
    }
  }
}
