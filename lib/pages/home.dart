import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  String? link;

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty? ModalRoute.of(context)!.settings.arguments as Map : data;
    link = data['isDayTime']?'day.png':'night.png';
    Color? bgColor = data['isDayTime']? Colors.blue[900]: Colors.indigo[200];
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$link'),
            fit: BoxFit.cover,
          ),


        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
          child: SafeArea(
            child:
           Column(
             crossAxisAlignment : CrossAxisAlignment.center,
            children: [
              Center(
                child: TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context,'/choose_city');
                    setState(() {
                      data = result;
                    });

                  },
                  icon: Icon(Icons.edit_location,color: Colors.grey[200],),
                  label: Text('Edit location',style:TextStyle(color:Colors.grey[200],fontSize: 15)),

                ),
              ),
              SizedBox(
                height: 25
              ),
              Center(
                child: Text(data['location'],style:TextStyle(
                  fontSize: 30,
                  letterSpacing: 2,
                  color:Colors.white,

                )),
              ),
              SizedBox(
                height: 25
              ),
              Center(child: Text(data['time'],style: TextStyle(fontSize: 66,color:Colors.white)))
            ],

          )

    ),
        ),
      ));
  }
}
