import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class contact extends StatefulWidget {
  @override
  contact_state createState() => contact_state();
}

class contact_state extends State<contact>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child:
            CircleAvatar(backgroundImage: AssetImage('assets/profile.png')),
          )
        ],
      ),
      body:

      Padding(

        padding: const EdgeInsets.all(8.0),

        child: Container(

          padding: EdgeInsets.fromLTRB(80, 190, 20, 50),
          child: RichText(

            textAlign: TextAlign.center,

            text: TextSpan(
              children: [

                TextSpan(
                  text: "Contact us at..\n",
                  style: TextStyle(color: Colors.black,fontSize: 20),

                ),
                WidgetSpan(
                  child: Icon(Icons.phone, size: 20),
                ),
                TextSpan(
                  text: "+91-969451357\n\n\n",
                    style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                ),
                TextSpan(
                  text: "Email us at..\n",
                  style: TextStyle(color: Colors.black,fontSize: 20),

                ),
                WidgetSpan(
                  child: Icon(Icons.email_outlined, size: 20),
                ),
                TextSpan(
                    text: "foodie123@gmail.com\n\n\n\n",
                    style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                ),
                TextSpan(
                  text: "At your service...",
                  style: TextStyle(color: Colors.black,fontSize: 20),

                ),
                WidgetSpan(
                  child: Icon(Icons.emoji_people_rounded, size: 20),
                ),
              ],
            ),
          )

        ),
      ),
    );
  }
}