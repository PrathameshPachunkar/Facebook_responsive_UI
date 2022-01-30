import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';

class CustomTabbar extends StatelessWidget {
  final Function(int) ontap;
  final List<IconData> icons;
  final int selectedindex;
  CustomTabbar(
      {@required this.ontap,
      @required this.icons,
      @required this.selectedindex});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: ontap,
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 3,
            color: Palette.facebookBlue,
          ),
        ),
      ),
      tabs: icons.asMap().map(
            (i, e) => MapEntry(
              i,
              Tab(
                icon: Icon(e,
                color: i==selectedindex?Palette.facebookBlue:Colors.black,
                ),
              ),
            )
          ).values.toList()
    );
  }
}
