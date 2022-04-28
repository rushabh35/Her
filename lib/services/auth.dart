import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationServices {

  final FirebaseAuth _firebaseAuth;

  CollectionReference _collectionReference =
  FirebaseFirestore.instance.collection('users');

  AuthenticationServices(this._firebaseAuth);

  Stream<User?> get authStateChanged => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String?> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signup(
      {required String email,
        required String password,
        required String name,
        }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = _firebaseAuth.currentUser;
      String? uid = user?.uid;

      await _firebaseAuth.currentUser?.sendEmailVerification();

      // await FirebaseMessaging.instance.subscribeToTopic('All');

      await _collectionReference.doc(uid).set({
        'uid': uid,
        'email': email,
        'name': name,
        'cycleLength': 28,
        'periodLength': 7,
        'onPeriod': false
      });

      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

}