import 'package:flutter/material.dart';

class Criclebutton extends StatelessWidget {
  final IconData icon;
  final Function onpressed;
  final double size;

  Criclebutton(
      {@required this.icon, @required this.onpressed, @required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),

      decoration: BoxDecoration(
          color: Colors.grey[200],
        shape: BoxShape.circle
      ),
      child: IconButton(
        onPressed: onpressed,
          iconSize: size,
          color: Colors.black,
          icon: Icon(icon,),),
    );
  }
}

