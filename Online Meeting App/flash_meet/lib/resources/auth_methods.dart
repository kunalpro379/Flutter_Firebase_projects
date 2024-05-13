import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:TurboFlashMeet/utils/utils.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> signInWithEmailPassword(
      BuildContext context, String email, String password) async {
    bool res = false;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        // Check if the user is new or existing
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(user.uid).get();

        if (!userDoc.exists) {
          // If the user is new, add their information to the Firestore collection
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.email, // You can modify this as needed
            'email': user.email,
            'profilePhoto':
                '', // You can set a default profile photo URL if needed
            'id': user.uid
          });
        }

        res = true;
      }
    } on FirebaseAuthException catch (e) {
      res = false;
      showSnackBar(context, e.message!);
    }

    return res;
  }
}
