import 'package:flutter/material.dart';
import 'package:flutter_apk_store/tools/colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
                      color: redColor1,
                      fontSize: 18.0,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
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
        ],
      ),
    );
  }
}
