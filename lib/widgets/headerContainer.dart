

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
          child:  Column(children: [

            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        //color: Colors.transparent,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: 5)],
                      ),
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.amber,
                        child: Image.asset("images/football_icon.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Column(
                      children: [
                        Text("SOCCER APP!",textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,

                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(5, 5),
                                  blurRadius: 8,
                                ),
                              ]
                          ),
                        ),
                        Text("Join The League\n To Capture The Moment",textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,

                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(5, 5),
                                  blurRadius: 8,
                                ),
                              ]
                          ),
                        )
                      ],
                    ),
                  ),
                  ],
              ),

              height: size.height/4,
              decoration: const BoxDecoration(color: Colors.amber,

                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                  boxShadow: [BoxShadow(offset: Offset(0,5),blurRadius: 1)]
              ),
            )],)


      ),
    );
  }
}
