import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profileavatar.dart';

class room extends StatelessWidget {
  final List<User> onlineuser;

  room({@required this.onlineuser});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 4,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineuser.length,
          itemBuilder: (BuildContext, index) {
            if (index == 0) {
              return _createroom();
            }
            final User user = onlineuser[index-1];
            return Padding(
             padding: EdgeInsets.symmetric(horizontal: 8),
              child: profileavatar(imageurl: user.imageUrl,isactive: true,),
            );
          }),
    );
  }
}

class _createroom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        textStyle: TextStyle(color: Palette.facebookBlue),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
        ),
        side: BorderSide(
          width: 2,
          color: Colors.blueAccent[100],
        )
      ),
      onPressed: () {
        print("create room");
      },
      child: Row(
        children: [
          ShaderMask(
            shaderCallback:(rect)=> Palette.createRoomGradient.createShader(rect),
            child: Icon(
              Icons.video_call,
              size: 35,
              color: Colors.white,
            ),
          ),
          Text("Create\nroom")
        ],
      ),
    );
  }
}
