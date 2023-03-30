import 'package:flutter/material.dart';
import 'package:world_clock/service/world_time_api.dart';

class ChooseCity extends StatefulWidget{
  @override
  State<ChooseCity> createState() => _ChooseCity();
}

class _ChooseCity extends State<ChooseCity>{
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),

  ];
  @override
  Widget build(BuildContext context)  {
    setData(index) async {
      Map data = {};
      WorldTime instance = locations[index];
      await instance.getTime();

      data = { 'location': instance.location,
      'time': instance.time,
      'flag' : instance.flag,
      'isDayTime': instance.isDayTime,};
       Navigator.pop(context,data);

    }
    return Scaffold(
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () async {

                    setData(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                      backgroundImage : AssetImage("assets/${locations[index].flag}")),
                )
              ),
            );
          })
    );
  }

}


