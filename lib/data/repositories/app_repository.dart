// ignore_for_file: use_rethrow_when_possible, depend_on_referenced_packages


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/chat.dart';
import '../models/message.dart';

class AppRepository {
  final CollectionReference chatCollection = FirebaseFirestore.instance.collection('/Chat/');

  void createChat(){}

  User? getUser() {
  return FirebaseAuth.instance.currentUser;
  }

  Stream<QuerySnapshot> get getChats{
    return chatCollection.snapshots();
  }

  List<Chat?> chatListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Chat(
                  Name: data['Name'],
                  Id: document.id,
                );
              })
              .toList()
              .cast();
  }
  Future<void> sendMessage(String chatId, String Text)async{
  User? user = await FirebaseAuth.instance.currentUser;
  await chatCollection.doc(chatId).collection('Message').doc().set({
    'UserId': user?.uid,
    'Text': Text,
    'createdAt':FieldValue.serverTimestamp()
  });

  }
  Stream<List<Message>> getMessages(String chatId) {
  User? user = FirebaseAuth.instance.currentUser;
    final docMessage = chatCollection.doc(chatId);
    return docMessage.collection('Message').orderBy('createdAt', descending: false).snapshots().map((snapshot) => snapshot.docs.map((doc) =>  Message.fromJson(doc.data(), user)).toList());
  }
}

