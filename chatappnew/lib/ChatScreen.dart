import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newchatapp/chat_messages.dart';
import 'package:newchatapp/new_chat.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("@FluTTerMessEnGer@"),
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.exit_to_app,
                  color: Theme.of(context).colorScheme.primary),
            )
          ],
        ),
        body: Column(
          children: const [Expanded(child: ChatMessages()), NewMessage()],
        )

/*
      body: const Center(
        child: Text("Logged In!"),
      ), 
      */
        );
  }
}
