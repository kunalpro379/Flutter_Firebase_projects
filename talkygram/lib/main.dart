import 'package:flutter/material.dart';
import 'package:talkygram/common/routes/pages.dart';
import 'package:talkygram/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  try {
    // Test Firebase functionality here
    await FirebaseFirestore.instance
        .collection('test')
        .add({'message': 'Hello, Firebase!'});

    runApp(const MyApp());
  } catch (e) {
    print('Firebase Error: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talkygram',
      home: Scaffold(
        body: Center(
          child: Text('Welcome to Talkygram!'),
        ),
      ),
    );
  }
}
