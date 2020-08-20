import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class EmergencyPage extends StatefulWidget {
  @override
  _EmergencyPageState createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Emergência'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: Text('Informações: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 20),
                const Icon(Icons.sentiment_very_satisfied),
                FlatButton(
                  onPressed: () {
                    /*...*/
                  },
                  child: Text("Delegacia da mulher: 180"),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 20),
                const Icon(Icons.sentiment_very_satisfied),
                FlatButton(
                  onPressed: () {
                    /*...*/
                  },
                  child: Text("Polícia Militar: 190"),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 20),
                const Icon(Icons.sentiment_very_satisfied),
                FlatButton(
                  onPressed: () {
                    /*...*/
                  },
                  child: Text("Samu: 192"),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 20),
                const Icon(Icons.sentiment_very_satisfied),
                FlatButton(
                  onPressed: () {
                    /*...*/
                  },
                  child: Text("Disque Direitos Humanos: 100"),
                ),
              ],
            ),
            FlatButton(
              onPressed: () => {},
              color: Colors.orange,
              padding: EdgeInsets.all(10.0),
              child: Text("SOS"),
            ),
            FlatButton(
              onPressed: () {
                /*...*/
              },
              child: Text("Deseja cadastrar um contato de emergência? "),
            ),
          ],
        ),
      ),
    );
  }
}
