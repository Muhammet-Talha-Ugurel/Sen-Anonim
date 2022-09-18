// ignore_for_file: use_rethrow_when_possible, depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/chat.dart';

class AppRepository {

  final CollectionReference chatCollection = FirebaseFirestore.instance.collection('/Chat/');

  void createChat(){}

  Stream<QuerySnapshot> get getChats{
    return chatCollection.snapshots();
  }

  List<Chat?> chatListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Chat(
                  Name: data['Name'],
                );
              })
              .toList()
              .cast();
  }
  void sendMessage(){}
  void getMessages(){}
}

