import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String name;
  final String email;
  final String password;
  final String phone;
  final String userid;


  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.userid
  }
  );

  factory UserModel.fromDocument(DocumentSnapshot doc){
    return UserModel(
        name: doc['name'],
        email: doc['email'],
        password: doc['password'],
        phone: doc['phone'],
        userid: doc['userid']

    );
  }
}