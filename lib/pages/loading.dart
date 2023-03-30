import 'package:flutter/material.dart';
import 'package:world_clock/service/world_time_api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget{

  State<Loading> createState() => _Loading();
}

class _Loading extends State<Loading>{
  String? home_time = 'loading';
  void setTime() async {

    WorldTime instance = WorldTime(location: 'Berlin', flag: 'berlin.png', url: "Europe/berlin");
    await instance.getTime();

    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag' : instance.flag,
      'isDayTime': instance.isDayTime,
    });




  }


  void initState(){
    super.initState();
    setTime();

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SpinKitWave(
        color: Colors.white,
        size: 50.0,
    ));
  }
}

