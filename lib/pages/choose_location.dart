import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime>locations=[WorldTime(url:'Africa/Johannesburg',location:'Johannesburg'),
    WorldTime(url:'America/Chicago',location:'Chicago'),
    WorldTime(url:'America/Costa_Rica',location:'Costa Rica'),
    WorldTime(url:'America/Los_Angeles',location:'Los Angeles'),
    WorldTime(url:'America/Toronto',location:'Toronto'),
    WorldTime(url:'Asia/Bangkok',location:'Bangkok'),
    WorldTime(url:'Asia/Colombo',location:'Colombo'),
    WorldTime(url:'Asia/Dhaka',location:'Dhaka'),
    WorldTime(url:'Asia/Dubai',location:'Dubai'),
    WorldTime(url:'Asia/Karachi',location:'Karachi'), WorldTime(url:'Asia/Kolkata',location:'Kolkata'),
    WorldTime(url:'Asia/Shanghai',location:'Shanghai'),
    WorldTime(url:'Australia/Perth',location:'Perth'),WorldTime(url:'Europe/Berlin',location:'Berlin'),
    WorldTime(url:'Europe/Paris',location:'Paris'),WorldTime(url:'Europe/Rome',location:'Rome'),
    WorldTime(url:'Indian/Maldives',location:'Maldives'), WorldTime(url:'Pacific/Honolulu',location:'Honolulu'),
    WorldTime(url:'Pacific/Auckland',location:'Auckland')
  ];
  void updateTime(index) async
  {
    WorldTime instance = locations[index];
    print(instance.location);
    await instance.getTime();
    Navigator.pop(context,{
      'location':instance.location,
      'time':instance.time,
      'isDayTime':instance.isDayTime
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose a location'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
          itemBuilder:(context,index){
          return
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: (){
                      updateTime(index);
                  },
                  title: Text(locations[index].location),
                ),
              ),
            );
          }
      ),
    );
  }
}

