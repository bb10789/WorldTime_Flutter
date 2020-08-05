import "package:http/http.dart";
import "dart:convert";
import "package:intl/intl.dart";

class WorldTime {
  String location; // location name ofr the UI
  String time; // time in that location
  String flag; // url to an aset flag icon
  String url; // location url for api endpoint
  bool isDayTime = false; // T/F if daytime or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response = await get("http://worldtimeapi.org/api/timezone/$url");
      Map data = json.decode(response.body);
      //print(data);

      //get properties from data
      String dateTime = data["datetime"];
      String offset = data["utc_offset"].substring(0,3);
      print(offset);
      //print(dateTime);
      //print(offset);

      // Create DateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime = now.hour > 6 && now.hour < 20 ? true: false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print("Caught error: $e");
      time = "could not get time data";
    }

  }
}