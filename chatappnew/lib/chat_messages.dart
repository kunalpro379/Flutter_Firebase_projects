import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newchatapp/message_bubble.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});
  Widget build(BuildContext context) {
    final authentcatedUser = FirebaseAuth.instance.currentUser!;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy(
              'createdAt',
              descending: true,
            )
            .snapshots(),
        builder: (ctx, chatSnapshots) {
          if (chatSnapshots.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!chatSnapshots.hasData ||
              chatSnapshots.data!.docs.isEmpty) {
            return Center(
              child: Text('No Message Found'),
            );
          } else if (chatSnapshots.hasError) {
            return const Center(
              child: Text('Something went Wrong....'),
            );
          }
          final loadedMessages = chatSnapshots.data!.docs;
          return ListView.builder(
              padding: const EdgeInsets.only(bottom: 50, left: 15, right: 15),
              reverse: true,
              itemCount: loadedMessages.length,
              itemBuilder: (ctx, index) {
                final ChatMessages = loadedMessages[index].data();
                final nextChatMessage = index + 1 < loadedMessages.length
                    ? loadedMessages[index + 1].data
                    : null;
                final currentMessageUserId = ChatMessages['userId'];
                final nextMessageUserId = nextChatMessage != null
                    ? nextChatMessage()['userId']
                    : null;
                final nextUserIsSame =
                    nextMessageUserId == currentMessageUserId;
                if (nextUserIsSame) {
                  return MessageBubble.next(
                      message: ChatMessages['text'],
                      isMe: authentcatedUser.uid == currentMessageUserId);
                } else {
                  return MessageBubble.first(
                    userImage: ChatMessages['userImage'],
                    username: ChatMessages['username'],
                    message: ChatMessages['text'],
                    isMe: authentcatedUser.uid == currentMessageUserId,
                  );
                }
              });
        });
  }
}
