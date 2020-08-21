import 'package:flutter/material.dart';

class Psychologist extends StatefulWidget {
  @override
  _PsychologistState createState() => _PsychologistState();
}

class _PsychologistState extends State<Psychologist> {
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        Card(
          child: ListTile(
            title: Text('Grosbilda Maria'),
            subtitle: Text('OAB: 12345/MG\nUberaba - MG'),
            trailing: Icon(Icons.message),
            isThreeLine: true,
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Josefina Martha'),
            subtitle: Text('OAB: 4321/SP\nRibeirão Preto - SP'),
            trailing: Icon(Icons.message),
            isThreeLine: true,
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Carlitos Tevez'),
            subtitle: Text('OAB: 4854/PR\nCuritiba - PR'),
            trailing: Icon(Icons.message),
            isThreeLine: true,
          ),
        ),
      ],
    );
  }
}
