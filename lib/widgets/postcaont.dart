import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/post_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profileavatar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class postcont extends StatelessWidget {
  final Post posts;

  postcont({@required this.posts});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                postheader(post: posts),
                Text(posts.caption),
                posts.imageUrl != null
                    ? SizedBox.shrink()
                    : SizedBox(
                        height: 6,
                      )
              ],
            ),
          ),
          posts.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: posts.imageUrl),
                )
              : SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: poststats(stats: posts),
          ),
        ],
      ),
    );
  }
}

class postheader extends StatelessWidget {
  final Post post;

  postheader({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        profileavatar(imageurl: post.user.imageUrl),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    "${post.timeAgo} • ",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    size: 12,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => print("more"),
          icon: Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}

class poststats extends StatelessWidget {
  final Post stats;

  poststats({@required this.stats});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Palette.facebookBlue, shape: BoxShape.circle),
              child: Icon(
                Icons.thumb_up,
                color: Colors.white,
                size: 10,
              ),
            ),
            Expanded(
              child: Text(
                '${stats.likes}',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Text(
              '${stats.comments}Comments',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              '${stats.shares}Shares',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            postbutton(
              ontap: () {
                print("like");
              },
              label: "Like",
              icon: Icon(MdiIcons.thumbUpOutline),
            ),
            postbutton(
              ontap: () {
                print("Comment");
              },
              label: "Comments",
              icon: Icon(MdiIcons.commentOutline),
            ),
            postbutton(
              ontap: () {
                print("Share");
              },
              label: "Share",
              icon: Icon(MdiIcons.shareOutline,
              size: 25,),
            ),
          ],
        ),
      ],
    );
  }
}

class postbutton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function ontap;

  postbutton({@required this.icon, @required this.label, @required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: ontap,
          child: Container(
            height: 25,
            padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  SizedBox(width: 4,),
                  Text(label),
                ],
              )),
        ),
      ),
    );
  }
}
