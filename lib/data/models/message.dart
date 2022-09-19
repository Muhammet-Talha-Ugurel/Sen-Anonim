import 'package:firebase_auth/firebase_auth.dart';

class Message{
  final String text;
  final bool sendByMe;
  Message({required this.text,required this.sendByMe});
  static Message fromJson(Map<String, dynamic> json, User? user){
   return Message(
      text: json['Text'],
      sendByMe: json['UserId'] == user!.uid ? true : false,
    );
  }
}