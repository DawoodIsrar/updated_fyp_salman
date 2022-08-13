// IMAGE LINK : https://unsplash.com/photos/bOBM8CB4ZC4

import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:footballapp/Football_Work/football_main_page.dart';
import 'package:footballapp/Football_Work/signup_page.dart';

import '../global.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var globalKey = GlobalKey<FormState>();
  TextEditingController eC = TextEditingController();
  TextEditingController pC = TextEditingController();

  saveform(BuildContext context) async {
    if (globalKey.currentState!.validate()) {
      print(eC.text);
      await fAuth
          .signInWithEmailAndPassword(email: eC.text.trim(), password: pC.text)
          .catchError((error) {
        switch (error.code) {
          case "ERROR_INVALID_EMAIL":
          // errorMessage = "Your email address appears to be malformed.";
            Fluttertoast.showToast(
                msg: "Your email address appears to be malformed");
            break;
          case "ERROR_WRONG_PASSWORD":
          // errorMessage = "Your password is wrong.";
            Fluttertoast.showToast(msg: "Your password is wrong.");

            break;
          case "ERROR_USER_NOT_FOUND":
          //errorMessage = "User with this email doesn't exist.";
            Fluttertoast.showToast(msg: "User with this email doesn't exist.");

            break;
          case "ERROR_USER_DISABLED":
          // errorMessage = "User with this email has been disabled.";
            Fluttertoast.showToast(
                msg: "User with this email has been disabled.");

            break;
          case "ERROR_TOO_MANY_REQUESTS":
          //errorMessage = "Too many requests. Try again later.";
            Fluttertoast.showToast(msg: "Too many requests. Try again later.");

            break;
          case "ERROR_OPERATION_NOT_ALLOWED":
          // errorMessage = "Signing in with Email and Password is not enabled.";
            Fluttertoast.showToast(
                msg: "Signing in with Email and Password is not enabled.");

            break;
        // default:
        //   // errorMessage = "An undefined Error happened.";
        //   Fluttertoast.showToast(msg: "An undefined Error happened.");
        }
      });
      var u = fAuth.currentUser?.uid;
      if (u != null) {
        // showDialog(
        //     context: context,
        //     builder: (context) {
        //       return ProgressBar(
        //         title: 'please wait...',
        //       );
        //     });
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (c) => FootballMainPage()), (route) => false);
      }
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
                  child: Container(color: Colors.black12,)
                ),
                Center(
                  child: Column(

                    children: [
                     // HeaderContainer(),
                      const Expanded(
                        child: const SizedBox(),
                      ),
                      Expanded(
                        flex: 7,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                            child: SizedBox(
                              width: size.width * .9,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: size.width * .25,
                                      bottom: size.width * .3,
                                    ),
                                    child:const  Text(
                                      'SIGN IN',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                  Form(
                                      key: globalKey,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20),
                                              ),
                                              child: TextFormField(
                                                keyboardType:
                                                TextInputType.emailAddress,
                                                onChanged: (value) {
                                                  setState(() {
                                                    value = eC.text;
                                                  });
                                                },
                                                controller: eC,
                                                validator: (input) =>
                                                input!.isNotEmpty
                                                    ? null
                                                    : "email should not be empty",
                                                decoration: InputDecoration(
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(color: Colors. amber, width: .5),
                                                    borderRadius: BorderRadius. circular(15.0),


                                                  ),
                                                  fillColor: Colors.black
                                                      .withOpacity(.1),
                                                  filled: true,
                                                  prefixIcon: Icon(
                                                    Icons.email,
                                                    color: Colors.amber
                                                        .withOpacity(.8),
                                                  ),
                                                  border: InputBorder.none,
                                                  hintMaxLines: 1,
                                                  labelText: "Email",labelStyle: const TextStyle(color: Colors.amber),
                                                  hintText: "your@email.com",
                                                  hintStyle: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white.withOpacity(.5),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20),
                                              ),
                                              child: TextFormField(
                                                obscureText: true,
                                                onChanged: (value) {
                                                  setState(() {
                                                    value = pC.text;
                                                  });
                                                },
                                                controller: pC,
                                                validator: (input) =>
                                                input!.isNotEmpty
                                                    ? null
                                                    : "Check your password",
                                                decoration: InputDecoration(
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(color: Colors. amber, width: .5),
                                                    borderRadius: BorderRadius. circular(15.0),


                                                  ),

                                                  fillColor: Colors.black
                                                      .withOpacity(.1),
                                                  filled: true,
                                                  prefixIcon: const Icon(
                                                    Icons.lock_outline,
                                                    color: Colors.amber,
                                                  ),
                                                  border: InputBorder.none,
                                                  hintMaxLines: 1,
                                                  labelText: "Password",labelStyle: const TextStyle(color: Colors.amber),
                                                  hintText: "Enter Password...",
                                                  hintStyle: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white
                                                        .withOpacity(.5),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
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
                                           //   Get.to(ResetPasswordPage(
                                             //     title: 'Reset Password'));
                                              // Fluttertoast.showToast(
                                              //   msg:
                                              //       'Forgotten password! button pressed',
                                              // );
                                            },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0,top:0.0),
                                        child: RichText(
                                          text: TextSpan(
                                            text: 'Create a new Account',
                                            style: const TextStyle(
                                              color: Colors.amber,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                HapticFeedback.lightImpact();
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (c) =>
                                                            SignUpPage()));
                                                 Fluttertoast.showToast(
                                                  msg:
                                                      'Create a new Account button pressed',
                                                 );
                                              },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: size.width * .1),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      HapticFeedback.lightImpact();
                                      saveform(context);
                                      // Fluttertoast.showToast(
                                      //   msg: 'Sign-In button pressed',
                                      // );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        bottom: size.width * .01,
                                      ),
                                      height: size.width / 8,
                                      width: size.width / 1.25,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Text(
                                        'Sing-In',
                                        style: TextStyle(
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
      String hintText,
      bool isPassword,
      bool isEmail,
      TextEditingController controller,
      ) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      width: size.width / 1.25,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: controller,
        onSubmitted: (String v) {
          controller.text = v;
        },
        style: TextStyle(
          color: Colors.white.withOpacity(.9),
        ),
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(.8),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
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