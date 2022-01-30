import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/widgets/Create_post.dart';
import 'package:flutter_facebook_responsive_ui/widgets/Rooms_widget.dart';
import 'package:flutter_facebook_responsive_ui/widgets/Stories_cont.dart';
import 'package:flutter_facebook_responsive_ui/widgets/circlewidget.dart';
import 'package:flutter_facebook_responsive_ui/widgets/postcaont.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'models/post_model.dart';
class Homescreen extends StatefulWidget {
 //const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
           // systemOverlayStyle: SystemUiOverlayStyle(
           //   statusBarBrightness: Brightness.light,
           // ),
            title: Text("Facebook",
              style: TextStyle(color: Palette.facebookBlue,
              fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            floating: true,
            actions: [
              Criclebutton(icon: Icons.search, onpressed: (){}, size:30, ),
              Criclebutton(icon:MdiIcons.facebookMessenger, onpressed: (){print('messenger');}, size: 30,)
            ],
          ),
          SliverToBoxAdapter(
            child: Createpost(currentuser: currentUser),
          ),
          SliverPadding(padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: room(onlineuser: onlineUsers,),
          ),
          ),
          SliverPadding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            sliver: SliverToBoxAdapter(
              child: stories_cont(currentuser: currentUser,Stories: stories,),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
              (context,index){
                final Post post = posts[index];
                return postcont(posts:post);
              },
              childCount:posts.length,
          ),)
        ],
      ),
    );
  }
}
