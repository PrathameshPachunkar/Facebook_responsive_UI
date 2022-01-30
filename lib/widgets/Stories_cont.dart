import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profileavatar.dart';

class stories_cont extends StatelessWidget {
  final User currentuser;
  final List<Story> Stories;

  stories_cont({
    @required this.currentuser,
    @required this.Stories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 10,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + Stories.length,
          itemBuilder: (BuildContex, index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: storycard(
                  addstory: true,
                  currentuser: currentuser,
                ),
              );
            }
            final Story story = Stories[index - 1];
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: storycard(
                  story: story,
                ));
          }),
    );
  }
}

class storycard extends StatelessWidget {
  final User currentuser;
  final bool addstory;
  final Story story;

  storycard({this.currentuser, this.addstory = false, this.story});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: addstory ? currentuser.imageUrl : story.imageUrl,
            fit: BoxFit.cover,
            height: double.infinity,
            width: 110,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Positioned(
            top:8.0,
            left: 8.0,
            child: addstory?Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: IconButton(
                icon: Icon(Icons.add,),
                color: Palette.facebookBlue,
                iconSize: 30,
                onPressed: (){
                  print("addstory");
                },
              ),
            ) : profileavatar(imageurl: story.user.imageUrl,
            storyborder: !story.isViewed,
            ),
        ),
        Positioned(
            left: 8,
            right: 8,
            bottom: 8,
            child: Text(
              addstory?"add to story":story.user.name,
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),),
      ],
    );
  }
}
