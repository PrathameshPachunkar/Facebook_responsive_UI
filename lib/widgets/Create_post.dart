import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profileavatar.dart';

class Createpost extends StatelessWidget {
  final User currentuser;

  Createpost({@required this.currentuser});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 8, 12, 0),
      color: Colors.white,
      child:Column(
        children: [
          Row(
            children: [
              profileavatar(imageurl: currentuser.imageUrl),
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(hintText: ("Whats\'s on your mind")),
                ),
              )
            ],
          ),
          Divider(height: 10,
          thickness: 0.5,
          ),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(onPressed: (){
                  print("live");
                },
                  icon: Icon(Icons.videocam,color: Colors.red,),
                label: Text("Live"),
                ),
                const VerticalDivider(width: 8,),
                TextButton.icon(onPressed: (){
                  print("Live");
                },
                  icon: Icon(Icons.photo_library,color: Colors.green,),
                  label: Text("Photos"),
                ),
                const VerticalDivider(width: 8,),
                TextButton.icon(onPressed: (){
                  print("Photos");
                },
                  icon: Icon(Icons.video_call,color: Colors.purpleAccent,),
                  label: Text("Videocall"),
                ),
              ],
            ),
          ),
        ],
      ) ,
    );
  }
}
