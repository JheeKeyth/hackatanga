import 'package:flutter/material.dart';
import 'package:hackatanga_project/screens/home/components/drawer2.dart';

class HomeChameleonPage extends StatefulWidget {
  @override
  _HomeChameleonPageState createState() => _HomeChameleonPageState();
}

class _HomeChameleonPageState extends State<HomeChameleonPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chameleon'),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: DrawerMenu2(),
        ),
        body: Center(
          child: Column(children: [
            SizedBox(height: 100),
            Image.asset('assets/images/Chamaleon1.jpg'),
            SizedBox(height: 15),
            Text(
              'Camaleões podem se camuflar a medida que se sintam ameaçados Para ver um camaleão em AR, utilize a câmera.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xFFFF6961),
          elevation: 5.0,
          child: Icon(
            Icons.camera_alt,
            color: Colors.white,
            size: 35,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
