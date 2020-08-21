import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackatanga_project/screens/chat/components/chat_message.dart';
import 'package:hackatanga_project/screens/chat/components/text_composer.dart';
import 'package:hackatanga_project/theme/constants.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title_app),
          centerTitle: true,
          elevation: 4,
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("messages")
                    .orderBy('senderDate')
                    .snapshots(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      return ListView.builder(
                        reverse: true,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index){
                          List r = snapshot.data.documents.toList();
                          return ChatMessage(r[index].data);
                        },
                      );
                  }
                },
              ),
            ),
            Divider(
              height: 4,
            ),
            Container(
              height: 80,
              padding: EdgeInsets.all(2),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: TextComposer(),
              ),
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(25.0),
                  topRight: const Radius.circular(25.0),
                ),
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {

  final Map<String, dynamic> data;

  ChatMessage(this.data);

  @override
  Widget build(BuildContext context) {
    print(this.data);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://thispersondoesnotexist.com/'),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  data["senderName"],
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Text(data["text"])
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}