import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackatanga_project/data/auth.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Chameleon',
                style: GoogleFonts.oswald(fontSize: 45, color: Colors.white),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            'Informações',
            style: GoogleFonts.oswald(fontSize: 25),
          ),
        ),
        Divider(
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: ListTile(
            title: Text('180: Delegacia da Mulher\n\n190: Polícia Militar\n\n192: Samu',
              style: GoogleFonts.roboto(fontSize: 18),
            ),
          ),
        ),
        Divider(
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            'Configurações',
            style: GoogleFonts.oswald(fontSize: 25),
          ),
        ),
        ListTile(
          title: Row(
            children: [
              Icon(Icons.person),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Perfil',
                  style: GoogleFonts.roboto(fontSize: 18),
                ),
              ),
            ],
          ),
          onTap: (){

          },
        ),
        ListTile(
          title: Row(
            children: [
              Icon(Icons.close),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Sair',
                  style: GoogleFonts.roboto(fontSize: 18),
                ),
              ),
            ],
          ),
          onTap: (){
            Auth().logoutGoogle(context);
          },
        ),
      ],
    );
  }
}
