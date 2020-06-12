import 'dart:async';

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Position _currentPosition;
  final Geolocator geoLocator = Geolocator()..forceAndroidLocationManager;
  Placemark currentAddress;
  _getCurrentLocation() {
    geoLocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      _getAddress();
    }).catchError((e) {
      print(e);
    });
  }
  _getAddress() async
  {
    try
    {
      List<Placemark>p = await geoLocator.placemarkFromCoordinates(_currentPosition.latitude,_currentPosition.longitude);
      Placemark place=p[0];
      setState(() {
        currentAddress=place;
      });
      if(_currentPosition!=null)
        {
          setUpWorldTime();
        }
    }
    catch(e)
    {
      print(e);
    }
  }
  void setUpWorldTime() async
  {
    String location1 ="${currentAddress.subAdministrativeArea}";
    print(location1);
    WorldTime instance= WorldTime(location:location1,url:'Asia/kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location':instance.location,
      'time':instance.time,
      'isDayTime':instance.isDayTime
    });
  }
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.brown[400],
        ),
      ),
    );
  }
}
