import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String name;
  final String email;
  final String password;
  final String userid;
  final String phone;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.userid,
    required this.phone

  }
  );

  factory UserModel.fromDocument(DocumentSnapshot doc){
    return UserModel(
        name: doc['name'],
        email: doc['email'],
        password: doc['password'],
        userid: doc['userid'],
        phone: doc['phone']

    );
  }
}