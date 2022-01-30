import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';

class profileavatar extends StatelessWidget {
 final String imageurl;
  final bool isactive;
  final bool storyborder;

 profileavatar({@required this.imageurl, this.isactive = false,this.storyborder=false});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
            radius: storyborder?17:20,
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(imageurl),
          ),
        ),
       isactive ? Positioned(
            right: 0,
            bottom: 0,
            child:Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.online,
                border: Border.all(color: Colors.white,width: 2.0)
              ),
            ),
        ) : const SizedBox.shrink(),
      ],
    );
  }
}
