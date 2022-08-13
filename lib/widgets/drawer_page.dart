import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:footballapp/Football_Work/All_Leagues_Page.dart';
import 'package:footballapp/Football_Work/Favorite_Page.dart';
import 'package:footballapp/Football_Work/Statistics_Page.dart';
import 'package:footballapp/Football_Work/fixture_page.dart';
import 'package:footballapp/Football_Work/football_main_page.dart';
import 'package:footballapp/widgets/Listtile_widget.dart';
import '../Football_Work/login_page.dart';
import '../global.dart';


class My_Drawer extends StatelessWidget {
   My_Drawer({Key? key}) : super(key: key);

  @override


  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: Colors.white,
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  [
            DrawerHeader(

              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/footbal_stadium.jpg"),
                      fit: BoxFit.cover
                  )
              ),
              child:Column(
                children: [
                  Text("FOOTBALL MATCHES",
                  style:TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white.withOpacity(0.5),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ) ,),




                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: Container(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black.withOpacity(0), //background color of button
                                side: const BorderSide(width:3, color:Colors.amber), //border width and color
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                padding: const EdgeInsets.all(5) //content padding inside button
                            ),
                            child: const Text('Login',
                              style: TextStyle(
                                fontSize: 16,
                              ),),
                            onPressed: () {
                              Navigator.push(
                                  context,MaterialPageRoute(
                                builder: (context)=>  LoginPage(),));
                            }
                        )
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2.5,
              height: 0,
              color: Colors.black45,

            ),



            listTile1(
              icons:const Icon(Icons.live_tv,
                color: Colors.amber,),
              title:"Scoreboard",
              onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => FootballMainPage()));


              }),

            listTile1(
              icons:const  Icon(CupertinoIcons.calendar,
                color: Colors.amber,),
              title:"Schedule",
              onPress:  (){
                if(currentFirebaseUser == null)
                {
                  Fluttertoast.showToast(
                      msg: "Please Login",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 2,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
                else
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Fixture_Page()));
                }
              },),
            listTile1(
              icons:const  Icon(Icons.favorite,
                color: Colors.amber,),
              title:"Subscribe",
              onPress: (){if(currentFirebaseUser == null)
              {
                Fluttertoast.showToast(
                    msg: "Please Login",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }
              else
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Favorite_page()));
              }
              },),
            listTile1(
              icons:const  Icon (CupertinoIcons.sportscourt_fill,
                color: Colors.amber,),
              title:"Leagues List",
              onPress: (){if(currentFirebaseUser == null)
              {
                Fluttertoast.showToast(
                    msg: "Please Login",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }
              else
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => All_Leagues()));
              }
              },),
            const Divider (
              thickness: 1,
              color: Colors.black45,
            ),

            Center(child: Text("Settings",style: TextStyle(
              color: Colors.white38,
              fontSize: 14
            ),)),
            //==============================================
          ],
        ),),
    );
  }
}
