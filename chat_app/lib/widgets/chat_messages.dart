import 'package:chat_app/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final currUser = FirebaseAuth.instance.currentUser!;

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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!chatSnapshots.hasData || chatSnapshots.data!.docs.isEmpty) {
            return const Center(
              child: Text('No messages found'),
            );
          }

          if (chatSnapshots.hasError) {
            return const Center(
              child: Text('Something went wrong... Please try again later!'),
            );
          }

          final loadedMessages = chatSnapshots.data!.docs;

          return ListView.builder(
              padding: const EdgeInsets.only(
                bottom: 40,
                left: 13,
                right: 13,
              ),
              reverse: true,
              itemCount: loadedMessages.length,
              itemBuilder: (context, index) {
                // retrieves this & next index's message
                final chatMessage = loadedMessages[index].data();
                final nextChatMessage = index + 1 < loadedMessages.length
                    ? loadedMessages[index + 1].data()
                    : null;

                // checks if both messages have the same user
                final currentMessageUserID = chatMessage['userId'];
                final nextMessageUserID =
                    nextChatMessage != null ? nextChatMessage['userId'] : null;
                final nextMessageUserIsSame =
                    nextMessageUserID == currentMessageUserID;

                // if have same user, this message will be the 'next' bubble style. if new user, message will be 'first' style
                if (nextMessageUserIsSame) {
                  return MessageBubble.next(
                      message: chatMessage['text'],
                      isMe: currUser.uid == currentMessageUserID);
                } else {
                  return MessageBubble.first(
                      userImage: chatMessage['userImage'],
                      username: chatMessage['username'],
                      message: chatMessage['text'],
                      isMe: currUser.uid == currentMessageUserID);
                }
              });
        });
  }
}
