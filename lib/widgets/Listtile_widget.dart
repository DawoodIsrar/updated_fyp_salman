import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footballapp/Football_Work/football_main_page.dart';

class listTile1 extends StatelessWidget {
  String?title;
  VoidCallback? onPress;
  Widget? icon;
  Widget? icons;
  listTile1({this.title,
    @required this.onPress,
    this.icon,
    this.icons,});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: ListTile(
        onTap: onPress,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
              color: Colors.amber,
              width: 0.5
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        leading: icons,
        title: Text(title?? "Scoreboard",
          textScaleFactor: 1.3,
          style:const TextStyle(
            color:Colors.amber,
          ),
        ),
      ),
    );
  }
}