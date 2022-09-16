// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/chat');
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width/5,
            child: Card(child: Center(child: Text('Room1',style: TextStyle(fontSize: 30),)),)),
        )
      ],),
    );
  }
}