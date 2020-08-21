import 'package:flutter/material.dart';
import 'package:hackatanga_project/screens/chat/chat.dart';
import 'package:hackatanga_project/screens/home/components/fab_bottom_app_bar.dart';
import 'package:hackatanga_project/screens/home/components/anchored_overlay.dart';
import 'package:hackatanga_project/screens/home/components/drawer.dart';
import 'package:hackatanga_project/screens/home/components/fab_with_icons.dart';
import 'package:hackatanga_project/screens/home/pages/home_page.dart';
import 'package:hackatanga_project/theme/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  int _lastSelected = 0;

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
        title: Text(
          title_app,
          textAlign: TextAlign.center,
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
          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
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
          child: FabWithIcons(
            icons: icons,
            onIconTapped: _selectedFab,
          ),
        );
      },
      child: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.security,
          color: Colors.white,
          size: 40,
        ),
        elevation: 5.0,
      ),
    );
  }

  Widget _screensHome(int index){
    if(index == 0){
      return HomePage();
    } else if(index == 1){
      return Chat();
    } else if(index == 2){
      return Container(color: Colors.deepOrange);
    } else if(index == 3){
      return Container(color: Colors.pinkAccent);
    }

    return null;
  }
}
