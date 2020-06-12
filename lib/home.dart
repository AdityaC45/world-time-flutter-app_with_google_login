import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'googlesignin.dart';
import 'main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


final signOut = false;
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  
  @override
  Widget build(BuildContext context) {
    data =data.isNotEmpty?data: ModalRoute.of(context).settings.arguments;

    print(data);
    String bgImage;
    if(data['isDayTime']==true)
      bgImage='day.png';
    else
      {
        bgImage = 'night.png';
      }
    return WillPopScope(
      onWillPop: ()=>Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[900],
            elevation: 0,
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async{
                      dynamic result = await signOutGoogle();
                      if(result)
                      {
                        Navigator.pop(context);
                      }
                    },
                    label: Text('Sign Out'
                    ,
                    style: TextStyle(
                      color:Colors.deepOrangeAccent
                    ),),
                    icon:Icon(
                      FontAwesomeIcons.signOutAlt,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ],
              )

            ],
          ),
          body:Container(
            decoration: BoxDecoration(
              image:DecorationImage(
                image:AssetImage('assets/$bgImage'),
                fit:BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,80,0,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(onPressed: () async{
                    dynamic result =await Navigator.pushNamed(context,'/location');
                    setState(() {
                      data={
                        'location':result['location'],
                        'time':result['time'],
                        'isDayTime':result['isDayTime']
                      };
                    });
                  },
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.white,
                      ),
                      label:Text('Edit Location',
                      style:TextStyle(
                        color: Colors.white,
                      ))
                  ),
                  SizedBox(height:20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(data['location'],
                      style:TextStyle(
                        fontSize: 30,
                        letterSpacing: 2,
                        color: Colors.white,
                      ))
                    ],
                  ),
                  SizedBox(height:20),
                  Text(
                    data['time'],
                    style:TextStyle(
                      fontSize: 40.0,
                      color:Colors.white,
                    )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
