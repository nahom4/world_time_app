import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String flag;
  String? time;
  String url;
  bool isDayTime = true;


  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async {
    try {
      Response res = await get(Uri.parse("https://www.worldtimeapi.org/api/timezone/$url"));
      Map value = jsonDecode(res.body);
      String dateTime = value['datetime'];
      String offset = value['utc_offset'];
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset.substring(1, 3))));
      isDayTime = now.hour > 6 && now.hour < 20? true: false;
      time = DateFormat.jm().format(now);

    }
    catch (e) {
      print(e);
      time = "could'nt load the time";
    }
  }



}