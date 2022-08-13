
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Text_Field extends StatefulWidget {
  String?labelText;
  String?hinttext;
  bool isPassword;
  TextEditingController? controller;
  String? Function(String?)? validate;
  Widget? icon;
  Widget? icons;
  bool check;
  final TextInputAction ? inputAction;
  final FocusNode? focusNode;

  int? maxLines;

  Text_Field(
      {
        this.labelText,
        this.hinttext,
        this.isPassword = false,
        this.controller,
        this.validate,
        this.icon,
        this.icons,
        this.check = false,
        this.inputAction,
        this.focusNode,
        this.maxLines, required Null Function(dynamic value) onChanged

      });

  @override
  State<Text_Field> createState()=>_Text_FieldState();
}
class _Text_FieldState extends State<Text_Field> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
      ),
      child: TextFormField(
        //maxLines: widget.maxLines == 1 ? 1 : widget.maxLines,
        focusNode: widget.focusNode,
        textInputAction: widget.inputAction,

        controller: widget.controller,
        validator: widget.validate,
        obscureText: widget.isPassword == false ? false : widget.isPassword,
        cursorColor: Colors.amber,
        decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white10
                )),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber)
            ),
            labelText: widget.labelText ?? 'labeltext',
            labelStyle: const TextStyle(color: Colors.amber),
            hintText: widget.hinttext ?? "Hint Text",
            suffixIcon: widget.icon,
          prefixIcon: widget.icons,
        ),
      ),

    ); //isPassword == true? Icon(Icons.visibility): null
  }
}
