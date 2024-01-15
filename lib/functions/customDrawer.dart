import 'package:flutter/material.dart';
import 'package:flutter_apk_store/screens/application_registration.dart';
import 'package:flutter_apk_store/screens/category.dart';
import 'package:flutter_apk_store/tools/colors.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    //var darkThemeProvider = Provider.of<DarkThemeProvider>(context);
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
                    'AppStash',
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
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const CategoryPage(category2: 'Social');
                },
              ));
            },
          ),
          ListTile(
            title: const Text('Games'),
            leading: const Icon(Icons.gamepad),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const CategoryPage(category2: 'Game');
                },
              ));
            },
          ),
          ListTile(
            title: const Text('Entertainment'),
            leading: const Icon(Icons.play_circle_fill),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const CategoryPage(category2: 'Entertainment');
                },
              ));
            },
          ),
          ListTile(
            title: const Text('Editor'),
            leading: const Icon(Icons.movie_creation),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const CategoryPage(category2: 'Editor');
                },
              ));
            },
          ),
          ListTile(
            title: const Text('App Registration'),
            leading: const Icon(Icons.add_to_photos_sharp),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MyForm();
                },
              ));
            },
          ),

          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
