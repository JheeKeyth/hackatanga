import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Query query =
FirebaseFirestore.instance.collection('firestore-example-app');

class Chat extends StatefulWidget {

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

