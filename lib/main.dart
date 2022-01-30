import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/homepage.dart';

import 'Nav_Screen/nav_screen.dart';

void main(){
  runApp(Facebook_app());
}
class Facebook_app extends StatefulWidget {
  @override
  _Facebook_appState createState() => _Facebook_appState();
}

class _Facebook_appState extends State<Facebook_app> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "facebook_app",
      theme: ThemeData(
        scaffoldBackgroundColor: Palette.scaffold ,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: Nav_screen(),
    );
  }
}

