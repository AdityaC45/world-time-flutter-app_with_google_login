import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_time/googlesignin.dart';
import 'package:world_time/home.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/loading.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  style: BorderStyle.solid,
                  color: Colors.grey[800],
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: FlatButton(
                onPressed: () async
                {

                    signInWithGoogle().whenComplete((){
                      Navigator.of(context).pushNamed('/loading');
                    });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image(
                      image:AssetImage('assets/google_logo.png'),
                      height:35.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Sign in with Google',
                        style: TextStyle(
                          color:Colors.grey[600],
                          fontSize: 15.0,
                        ),),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
