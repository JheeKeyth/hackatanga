import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackatanga_project/screens/chat/chat.dart';
import 'package:hackatanga_project/screens/home/components/fab_bottom_app_bar.dart';
import 'package:hackatanga_project/screens/home/components/anchored_overlay.dart';
import 'package:hackatanga_project/screens/home/components/drawer.dart';
import 'package:hackatanga_project/screens/home/components/fab_with_icons.dart';
import 'package:hackatanga_project/screens/home/pages/emergency_page.dart';
import 'package:hackatanga_project/screens/home/pages/home_page.dart';
import 'package:hackatanga_project/screens/home/pages/juristical_page.dart';
import 'package:hackatanga_project/screens/home/pages/psychologist_page.dart';
import 'package:hackatanga_project/theme/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class Home extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  int _lastSelected = 0;
  Position _currentPosition;

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = index;
    });
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            title_app,
            style: GoogleFonts.oswald(
              fontSize: 24,
            ),
          ),
        ),
        elevation: 3,
      ),
      drawer: Drawer(
        child: DrawerMenu(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(context),
      body: _screensHome(_lastSelected),
      bottomNavigationBar: FABBottomAppBar(
        //centerItemText: 'A',
        color: Color(0xFFa181cf),
        selectedColor: Color(0xFFa181cf),
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.call, text: 'Emergência'),
          FABBottomAppBarItem(iconData: Icons.gavel, text: 'Jurídico'),
          FABBottomAppBarItem(iconData: Icons.person, text: 'Psicologo'),
          FABBottomAppBarItem(iconData: Icons.group, text: 'Apoio'),
        ],
      ),
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [Icons.phone, Icons.textsms];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          // child: FabWithIcons(
          //   icons: icons,
          //   onIconTapped: _selectedFab,
          // ),
        );
      },
      child: FloatingActionButton(
        onPressed: () {
          _getCurrentLocation();
        },
        child: Text('SOS', style: TextStyle(color: Colors.white, fontSize: 15)),
        elevation: 5.0,
        backgroundColor: Color.fromRGBO(255, 105, 97, .7),
      ),
    );
  }

  Widget _screensHome(int index) {
    if (index == 0) {
      return EmergencyPage();
    } else if (index == 1) {
      return Juristical();
      // return Chat();
    } else if (index == 2) {
      return Psychologist();
    } else if (index == 3) {
      // return Chat();
    }

    return null;
  }

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      String texto = 'Erro ao pegar localização da vítima.';
      if (_currentPosition != null) {
        texto =
            "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}";
      }
      FlutterOpenWhatsapp.sendSingleMessage("5534991572772", texto);
    }).catchError((e) {
      print(e);
    });
  }
}
