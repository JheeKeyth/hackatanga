import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class EmergencyContactsPage extends StatefulWidget {
  @override
  _EmergencyContactsPageState createState() => _EmergencyContactsPageState();
}

class _EmergencyContactsPageState extends State<EmergencyContactsPage> {
  List<String> contacts = [
    "Aline",
    "Mãe",
    "Delegada",
    "Grupo de Apoio",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Emergência',
            style: GoogleFonts.oswald(
              textStyle: TextStyle(fontSize: 24, letterSpacing: 1.5),
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFFCFA181),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 48),
            Flexible(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: contacts.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return new Center(
                      child: Column(
                        children: [
                          // inicio botao
                          SizedBox(height: 12),
                          SizedBox(
                            height: 48,
                            width: 332,
                            child: RaisedButton(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              onPressed: () {
                                print("texto");
                              },
                              color: Color(0xFFCFA181),
                              textColor: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // Replace with a Row for horizontal icon + text
                                children: <Widget>[
                                  Icon(Icons.person, size: 48),
                                  Text(contacts[index],
                                      style: TextStyle(fontSize: 20))
                                ],
                              ),
                            ),
                          ),
                          //fim botão
                        ],
                      ),
                    );
                  }),
            ),
            //Add contacts button start
            SizedBox(height: 12),
            SizedBox(
              height: 48,
              width: 332,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                onPressed: () {},
                color: Color(0xFF9d7254),
                textColor: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon(Icons.person_add, size: 48),
                    Text('Novo Contato', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
            //fim botao mais contatos
          ],
        ),
      ),
    );
  }
}
