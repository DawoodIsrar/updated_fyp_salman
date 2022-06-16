import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class fbutton extends StatelessWidget {
  bool?isLoginButton;
  String?title;
  VoidCallback? onPress;
  fbutton({this.title,this.isLoginButton=false,this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(title??"Button",style: TextStyle(
            color: isLoginButton==false ? Colors.amber :Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),),
        ),
        height: 60,width: double.infinity ,
        margin: EdgeInsets.symmetric(vertical: 7,horizontal: 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: isLoginButton == false?
          Colors.amber:Colors.amber,
          ),

          color: isLoginButton ==false?Colors.white.withOpacity(0.1):Colors.amber,
        ),
      ),
    );
  }
}
