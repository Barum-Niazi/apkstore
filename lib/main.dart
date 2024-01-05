import 'package:flutter/material.dart';
import 'package:flutter_apk_store/providers/darkThemeProvider.dart';
import 'package:flutter_apk_store/screens/splashScreen.dart';
import 'package:flutter_apk_store/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreference.getTheme();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            darkTheme: ThemeData.dark(),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
            routes: <String, WidgetBuilder>{
              '/splash': (BuildContext context) => const SplashScreen(),
            },
          );
        },
      ),
    );
  }
}
