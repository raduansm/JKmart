import 'package:flutter/material.dart';
import 'package:jkmart/screens/home/widgets/drawer_data.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 110, 20, 0),
        color: const Color.fromARGB(255, 243, 245, 243),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Mr. X',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),

                drawer_data(
                  // imagePath: 'images/delivery_man.png',
                  textData: 'Main APP',
                  width: 12,
                  onTap: () {},
                ),
                drawer_data(
                  // imagePath: 'images/delivery_man.png',
                  textData: 'Delivery APP ',
                  width: 12,
                  onTap: () {},
                ),
                // drawer_data(
                //   imagePath: 'images/delivery_man.png',
                //   textData: 'Contact',
                //   width: 2,
                //   onTap: () {
                //     // Navigator.push(context, CupertinoPageRoute(builder: (_) => ContactPage()));
                //   },
                // ),
              ],
            ),
            Positioned(
              bottom: 60.0,
              child: drawer_data(
                // imagePath: 'images/delivery_man.png',
                textData: 'LOG OUT',
                width: 10,
                onTap: () {
                  // BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                  print("Pressed! Logout!");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
