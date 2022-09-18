// ignore_for_file: use_rethrow_when_possible, depend_on_referenced_packages
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepository {

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('User');
  

  Future<bool?> attemptAutoLogin() async{
    User? user = await FirebaseAuth.instance.currentUser;
    if (user == null) {
      return false;
    } else {
      return true;
    }
  
  }

  void createAcount() async {
    final gmail = '@mtu.com';
    const uuid = Uuid();
    final emailAddress = uuid.v4();
    final password = uuid.v4();
    UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailAddress + gmail,
    password: password,
  );
  User? user = result.user;
  await userCollection.doc(user!.uid).set({
    'uid': user.uid,
  });
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailAddress + gmail,
    password: password
  );
  }
}
