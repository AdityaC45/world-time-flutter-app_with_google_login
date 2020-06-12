import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart';

class WorldTime
{
  String location;
  String time;
  String url;
  bool isDayTime;
  WorldTime({this.location,this.url});
  
  Future<void>getTime() async
  {
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      String hours =offset.substring(1,3);
      print(hours);
      String minutes = offset.substring(4,offset.length);
      print(minutes);
      DateTime now =DateTime.parse(datetime);
      print(now);
      print(offset);
      if(offset[0]=='+')
      {
        now=now.add(Duration(hours: int.parse(hours),minutes:int.parse(minutes)));
      }
      else
        {
          now=now.subtract(Duration(hours: int.parse(hours),minutes:int.parse(minutes)));
        }
      time=DateFormat.jm().format(now);
      isDayTime=(now.hour>=6 && now.hour<=18)?true:false;
    }
    catch(e){
      print('Error catch:$e');
      time='could not get time data';
    }

  }
}