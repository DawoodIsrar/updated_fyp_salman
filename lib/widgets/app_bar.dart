import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  Color? backgrounColor;
  CustomAppBar({this.title,this.backgrounColor});


  @override
  Size get preferredSize => Size.fromHeight(50.0);
  Widget build(BuildContext context) {
    return AppBar(

        backgroundColor: backgrounColor,
        centerTitle: true,
        elevation: 1.0,
        title:Text(title!,
          style: TextStyle(
            color: Colors.white70,
            fontStyle: FontStyle.italic,
          ),),



    );
  }
}
