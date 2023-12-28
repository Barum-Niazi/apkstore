import 'package:flutter/material.dart';
import 'package:flutter_game_shop_ui/appinfo.dart';

class AppDetailsScreen extends StatelessWidget {
  final AppInfo appInfo;

  const AppDetailsScreen({Key? key, required this.appInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Details'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: ${appInfo.name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Category: ${appInfo.category}'),
              SizedBox(height: 8),
              Text('Rating: ${appInfo.rating}'),
              SizedBox(height: 8),
              // Add more details as needed
            ],
          ),
        ),
      ),
    );
  }
}
