import 'package:flutter/material.dart';
import 'package:flutter_apk_store/tools/colors.dart';
import 'package:provider/provider.dart';

import '../providers/darkThemeProvider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    var darkThemeProvider = Provider.of<DarkThemeProvider>(context);
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 100.0,
            child: DrawerHeader(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffF2F2F2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    'APK STORE',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: themeRed1,
                      fontSize: 18.0,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
            ),
          ),

          //make theme switcher here
          ListTile(
            title: const Text('Social'),
            leading: const Icon(Icons.social_distance),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Games'),
            leading: const Icon(Icons.gamepad),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Enterainment'),
            leading: const Icon(Icons.play_circle_fill),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Editor'),
            leading: const Icon(Icons.movie_creation),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Settings'),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  thumbIcon: MaterialStateProperty.all(
                    Icon(
                      isSwitched ? Icons.brightness_2 : Icons.brightness_7,
                      color: Colors.white,
                    ),
                  ),
                  // This bool value toggles the switch.
                  value: isSwitched,
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      isSwitched = value;
                      darkThemeProvider.darkTheme = value;
                    });
                  },
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
