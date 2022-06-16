import 'package:flutter/material.dart';
class TexttButton extends StatelessWidget {
  String?titletext;
  VoidCallback? onpress;
  TexttButton({this.titletext, this.onpress});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          GestureDetector(
            onTap: onpress,
            child: TextButton(onPressed: null,
                child: Text(titletext??"title"
                  ,style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 16
                  ),
                )),
          )
        ] ,
      ),
    );
  }
}
