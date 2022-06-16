import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footballapp/Football_Work/signup_page.dart';

import '../widgets/button.dart';
import '../widgets/headerContainer.dart';
import '../widgets/textbutton.dart';
import '../widgets/textfield.dart';
import 'Favorite_Page.dart';


class LoginPage extends StatefulWidget {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordCon = TextEditingController();


  bool ispassword=false;
  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Center(

              child: Column(
                children:   [
                  HeaderContainer(),


                  // will be continue

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                      ),
                      child: Form(

                          child: Column(
                          children: [
                            Text_Field(
                              //controller: emailC,
                              icons: Icon(Icons.mail,color: Colors.amber,),
                                labelText:"Email",
                                hinttext:"Enter Username"
                            ),
                          Text_Field(
                            icons: Icon(Icons.lock,color: Colors.amber,),
                            icon: IconButton(
                              onPressed: (){
                                setState(() {
                                });
                              },
                              icon: Icon(Icons.visibility,color: Colors.amber,),
                            ),
                            //isPassword: ispassword,
                              labelText:"Password",
                              hinttext:"Enter password",

                          ),
                        //+++++++++TEXTBUTTON+++++++++++++++++++++++++++++++++++
                        TexttButton(titletext: "Forgot Password",),
                        //++++++++++++++Btton+++++++++++++++++++++++++++++++
                        fbutton(
                          title:"Login",
                          isLoginButton: true,
                          onPress: (){
                            Navigator.push(context, MaterialPageRoute(builder:(_)=>Favorite_page()));
                          },
                        ),
                        //==========TextButton==================
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Row(
                            children: [
                              const Text("Does not have an account",),
                              TexttButton(titletext: "Sign up",
                                  onpress: (){Navigator.push(context, MaterialPageRoute(builder: (_)=> Signup_Page()));},
                                ),
                            ],
                          ),
                        ),
                        //==================================

                      ],)),
                    ),
                  ),
                  Divider(thickness: 2,),
                  Text("OR"),

                    fbutton(


                    title:"Use Google account",
                    isLoginButton: false,

                  ),


                ],
              ),
            ),
          ),
        ),


    );
  }
}
