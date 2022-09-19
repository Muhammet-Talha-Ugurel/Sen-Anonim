// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String text;
  final bool sendByMe;

  const Message({super.key, required this.text, required this.sendByMe});
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: sendByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children:[
                    Card(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(text,),
                    ),),
                  ],
                ),
              );
  }
}