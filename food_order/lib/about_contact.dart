import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class about_Us extends StatefulWidget {
  @override
  about_Us_State createState() => about_Us_State();
}

class about_Us_State extends State<about_Us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => home()));
          },
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: RichText(
            text: TextSpan(
                text: 'This app is created for a any particular restaurant to deliver food on time. This project is guided by ',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(text: 'Jyoti maam',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // open desired screen
                        }
                  ),
                  TextSpan(
                      text: ' Members of are Group are ',
                      style: TextStyle(color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)
                  ),

                  TextSpan(
                      text: '\n\nAnushika Bala \n\nIshaa Abdul \n\n Sravya Sistla \n\n Esha Bawaskar,',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // open desired screen
                        }
                  ),
                ]
            ),
          )
      ),
    );

  }
}
