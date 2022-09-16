// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:senanonim/presentation/widgets/message.dart';

class ChatScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Expanded(
          child: Column(
            children: [
              Message(text: "test", sendByMe: true),
              Message(text: "test", sendByMe: true),
              Message(text: "test", sendByMe: true),
              Message(text: "test", sendByMe: true),

        ],)),
        Row(
          children: [
            Flexible(
              child: TextFormField(
                decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    hintText: "First Name",
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Color.fromARGB(255, 22, 21, 21)))),
            ),
            GestureDetector(
              onTap: () {
                
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.send_rounded),
              ),
            )
          ],
        ),
                
      ],),
    );
  }
}