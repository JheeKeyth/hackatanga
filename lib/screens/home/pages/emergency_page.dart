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
          backgroundColor: Color(0xFFCFA181),
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: null),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 12),
              SizedBox(
                height: 47,
                width: 332,
                child: RaisedButton(
                  onPressed: () {},
                  color: Color(0xFFCFA181),
                  textColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Icon(Icons.person),
                      Text('Delegacia', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ),
              //inicio botao mais contatos
              SizedBox(height: 12),
              SizedBox(
                height: 47,
                width: 332,
                child: RaisedButton(
                  onPressed: () {},
                  color: Color(0xFF9d7254),
                  textColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Icon(Icons.person_add),
                      Text('Novo Contato', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ),
              //fim botao mais contatos
            ],
          ),
        ),
      ),
    );
  }
}
