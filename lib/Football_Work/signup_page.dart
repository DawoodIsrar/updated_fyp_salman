// IMAGE LINK : https://unsplash.com/photos/bOBM8CB4ZC4

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:footballapp/Football_Work/football_main_page.dart';


import '../global.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var globalKey = GlobalKey<FormState>();
  TextEditingController uC = TextEditingController();

  TextEditingController eC = TextEditingController();
  TextEditingController pC = TextEditingController();

  saveform(BuildContext context) async {
    print(eC.text);

    await fAuth
        .createUserWithEmailAndPassword(
        email: eC.text.trim(), password: pC.text)
        .catchError((errmsg) {
      Fluttertoast.showToast(msg: errmsg);
    });
    Map userMap = {'name': uC.text, 'email': eC.text, 'password': pC.text};
    FirebaseFirestore db = FirebaseFirestore.instance;
    // this will upload the file and store url in the variable 'url'
    var u = fAuth.currentUser?.uid;

    await db.collection("user").add({
      'name': uC.text,
      'email': eC.text,
      'uid': u,
    });

    if (u != null) {
      Navigator.push(context, MaterialPageRoute(builder: (c) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                SizedBox(
                  height: size.height,
                  child: Image.asset(
                    'images/footbal_stadium.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      const Expanded(
                        child: const SizedBox(),
                      ),
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: const EdgeInsets.only(left:0.0, top:50.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaY: 25, sigmaX: 25),
                              child: SizedBox(
                                width: size.width * .9,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: size.width * .10,
                                        bottom: size.width * .1,
                                      ),
                                      child: const Text(
                                        'SIGN UP',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ),
                                    component(
                                      Icons.account_circle_outlined,
                                      'Full Name',
                                      'Enter your name',
                                      false,
                                      false,
                                      uC,
                                    ),
                                    component(
                                      Icons.email_outlined,
                                      'Email',
                                      'your@email.com',
                                      false,
                                      true,
                                      eC,
                                    ),
                                    component(
                                      Icons.lock_outline,
                                      'Password',
                                      'Enter Password',
                                      true,
                                      false,
                                      pC,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: 'Forgotten password?',
                                            style: const TextStyle(
                                              color: Colors.amber,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                HapticFeedback.lightImpact();

                                                Fluttertoast.showToast(
                                                  msg:
                                                  'Forgotten password! button pressed',
                                                );
                                              },
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Already have account?',
                                            style: const TextStyle(
                                              color: Colors.amber,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                HapticFeedback.lightImpact();
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                        context) =>
                                                            LoginPage()));
                                                // Fluttertoast.showToast(
                                                //   msg:
                                                //       'Create a new Account button pressed',
                                                // );
                                              },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: size.width * .3),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        HapticFeedback.lightImpact();
                                        saveform(context);
                                        // Fluttertoast.showToast(
                                        //   msg: 'Sign-Up button pressed',
                                        // );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          bottom: size.width * .1,

                                        ),
                                        height: size.width / 7,
                                        width: size.width / 1.25,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: const Text(
                                          'Sing Up',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: const SizedBox(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget component(

      IconData icon,
      String labelText,
      String hintText,
      bool isPassword,
      bool isEmail,
      TextEditingController controller,
      ) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 7,
      width: size.width / 1.25,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: Colors.white.withOpacity(.9),
        ),
        onSubmitted: (String v) {
          controller.text = v;
        },
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(


          prefixIcon: Icon(
            icon,
            color: Colors.amber,
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.amber),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context,
      Widget child,
      AxisDirection axisDirection,
      ) {
    return child;
  }
}
