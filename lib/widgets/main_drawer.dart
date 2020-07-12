import 'package:flutter/material.dart';
import '../screens/settings_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(title),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
              height: 250,
              width: double.infinity,
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    'assests/images/background.jpg',
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child: Icon(
                            Icons.account_circle,
                            color: Colors.grey,
                            size: 100,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Android User',
                          style: TextStyle(
                            shadows: <Shadow>[
                              Shadow(offset: Offset(2, 2), blurRadius: 3)
                            ],
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant_menu, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Settings', Icons.settings, () {
            Navigator.of(context)
                .pushReplacementNamed(SettingsScreen.routeName);
          })
        ],
      ),
    );
  }
}
