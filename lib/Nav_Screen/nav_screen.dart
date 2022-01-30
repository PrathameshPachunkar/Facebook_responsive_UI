import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/widgets/CustomTabbar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../homepage.dart';

class Nav_screen extends StatefulWidget {
  @override
  _Nav_screenState createState() => _Nav_screenState();
}

class _Nav_screenState extends State<Nav_screen> {
  final List<Widget> Screen = [
    Homescreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountGroupOutline,
    MdiIcons.accountCircleOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
      body: IndexedStack(index:selected,children:Screen),
        bottomNavigationBar: CustomTabbar(
          selectedindex: selected,
          icons: _icons,
          ontap:(index){
            setState(() {
              selected=index;
            });
          }
        ),
      ),
    );
  }
}
