import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_order/home.dart';
import 'package:food_order/user_model.dart';

import 'bottom_Container.dart';


class ProfilePage extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(ProfilePage.pattern.toString());

  @override
  _ProfilePageState createState() => _ProfilePageState();
}
late UserModel userModel;
class _ProfilePageState extends State<ProfilePage> {
  bool isEdit = false;

  TextEditingController name =
  TextEditingController(text: userModel.name);
  TextEditingController email =
  TextEditingController(text: userModel.email);

  Widget textFromField({required String hintText}) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: ListTile(
        leading: Text(hintText),
      ),
    );
  }

  void profileVaidation(
      {required TextEditingController? email,
        required TextEditingController? name,
        required BuildContext context}) async {
    if (name!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("fullName is empty"),
        ),
      );
      return;
    } else if (email!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Email address is empty"),
        ),
      );
      return;
    } else if (!widget.regExp.hasMatch(email.text.trim())) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Invalid email address"),
        ),
      );
      return;
    } else {
      buildUpdateProfile();
    }
  }

  Widget nonEditTextField() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/profile.png"),
              radius: 50,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        textFromField(hintText: userModel.name),
        SizedBox(
          height: 10,
        ),
        textFromField(hintText: userModel.email),
      ],
    );
  }

  Widget editTextField() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/profile.png"),
              radius: 50,
            ),
          ],
        ),
        TextFormField(
          controller: name,
          decoration: InputDecoration(hintText: "fullName"),
        ),
        TextFormField(
          controller: email,
          decoration: InputDecoration(
            hintText: "emailAddress",
          ),
        ),
        SizedBox(
          height: 10,
        ),
        MyButton(
          onPressed: () {
            profileVaidation(
              context: context,
              email: email,
              name: name,
            );
          },
          text: "Up date",
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    buildUpdateProfile().whenComplete((){
      setState(() {

      });
    });
  }
  Future buildUpdateProfile() async {

    FirebaseFirestore.instance
        .collection("UserData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(
      {
        "name": name.text,
        "email": email.text,
      },
    ).then(
          (value) => RoutingPage.goTonext(
        context: context,
        navigateTo: home(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: isEdit
            ? IconButton(
          onPressed: () {
            setState(() {
              isEdit = false;
            });
          },
          icon: Icon(Icons.close),
        )
            : IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isEdit = true;
              });
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: isEdit ? editTextField() : nonEditTextField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class RoutingPage {
  static goTonext({required BuildContext context, required Widget navigateTo}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => navigateTo,
      ),
    );
  }
}