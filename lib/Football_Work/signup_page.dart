

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footballapp/Football_Work/login_page.dart';
import '../services/firebase_services.dart';
import '../widgets/button.dart';
import '../widgets/textfield.dart';



class Signup_Page extends StatefulWidget {

  TextEditingController fnameC = TextEditingController();
  TextEditingController lnameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController repassC = TextEditingController();
  bool ispassword = true;
  bool isrepassword = true;
  FocusNode?passwordfocus;
  FocusNode?repasswordfocus;
  final _formkey = GlobalKey<FormState>();
  bool formStateLoading = false;
  @override
  void dispose(){
    fnameC.dispose();
    lnameC.dispose();
    emailC.dispose();
    passC.dispose();
    repassC.dispose();
    //super.dispose();

  }
  Future<void> fDialogue(String error,BuildContext context) async {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(error),
            actions: [
              fbutton(
                title: 'ok',
                onPress: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
//
  submit(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        formStateLoading = true;
      });
      if (passC.text == repassC.text) {
        String? accountstatus =
        await FirebaseServices.createAccount(emailC.text, passC.text);

        //print(accountstatus);
        if (accountstatus != null) {
          fDialogue(accountstatus, context);
          setState(() {
            formStateLoading = false;
          });
        } else {
          Navigator.pop(context);
        }

        //  Navigator.push(
        //       context, MaterialPageRoute(builder: (_) => LoginScreen()));

      }
    }
  }
  State<Signup_Page> createState()=>_Signup_PageState();

  void setState(Null Function() param0) {}
}
class _Signup_PageState extends State<Signup_Page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(

          child: Container(
              height: 620,

              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(1), BlendMode.dstATop),
                      image: AssetImage("images/footbal_stadium.jpg"),
                      fit: BoxFit.cover
                  )
              ),

              child: SingleChildScrollView(
                child: Form(
                  key: widget._formkey,
                  child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top:20.0,left: 15,right: 20,bottom: 10),
                            child: Container(

                              decoration:  BoxDecoration(

                                //color: Colors.transparent,
                                shape: BoxShape.circle,
                                boxShadow: [


                                  BoxShadow(blurRadius: 10, color: Colors.amber, spreadRadius: 5)],
                              ),
                              child: CircleAvatar(

                                radius: 45.0,
                                backgroundColor: Colors.amber,
                                child: Image.asset("images/football_icon.png"),
                              ),
                            ),
                          ),
                        ),

                        Column(
                          children: [
                            Text("SOCCER APP!",textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.amber.withOpacity(0.5),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,

                                  shadows: [
                                    Shadow(
                                        color: Colors.amber,
                                      offset: Offset(5, 5),
                                      blurRadius: 8,
                                      ),
                                    ]
                                ),
                              ),
                              Text("Join The League\n To Capture The Moment",textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.amber.withOpacity(0.5),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    shadows: const [
                                      Shadow(
                                        color: Colors.amber,
                                        offset: Offset(5, 5),
                                        blurRadius: 8,
                                      ),
                                    ]
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const Divider(thickness: 2,),
                      const Text("Registeration Form",textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,),),
                      Text_Field(
                          validate: (v){
                            if(v!.isEmpty ||
                                v.contains("!@#%^&*()_-+=}{][|;:?><,./") ||
                                v.contains("1234567890")
                            ){return "Full Name only contain Alphabates! ";}
                            return null;
                          },
                          inputAction: TextInputAction.next,
                          controller: widget.lnameC,
                          icons: Icon(Icons.account_circle,color: Colors.amber,),
                          labelText:"Full Name",
                          hinttext:"Enter fullname"
                      ),
                      Text_Field(
                          validate: (v){
                            if(v!.isEmpty ||
                                !v.contains("@") ||
                                !v.contains(".com"))
                            {return "email is baly formatted! ";}
                            return null;},
                          inputAction: TextInputAction.next,
                          controller: widget.emailC,
                          icons: Icon(Icons.mail,color: Colors.amber,),
                          labelText:"Email",
                          hinttext:"yourmail@google.com"
                      ),
                      Text_Field(
                          validate: (v){
                            if(v!.isEmpty){return "Password should not be empty! ";}
                            return null;
                          },
                          focusNode: widget.passwordfocus,
                          inputAction: TextInputAction.next,
                          controller: widget.passC,
                          isPassword: widget.ispassword,
                          icon: IconButton(onPressed: (){
                            setState(() {
                              widget.ispassword = !widget.ispassword;
                            });},
                            icon: widget.ispassword? Icon(Icons.visibility_off,color: Colors.amber,):Icon(Icons.visibility,color: Colors.amber,),
                          ),
                          icons: Icon(Icons.lock,color: Colors.amber,),
                          labelText:"Password",
                          hinttext:"Enter password"
                      ),
                      Text_Field(
                          focusNode: widget.repasswordfocus,
                          inputAction: TextInputAction.done,
                          controller: widget.repassC,
                          isPassword: widget.isrepassword,
                          icons: Icon(Icons.lock,color: Colors.amber,),
                          icon: IconButton(
                            onPressed: (){
                              setState(() {
                                widget.isrepassword = !widget.isrepassword;
                              });
                            },icon: widget.isrepassword? Icon(Icons.visibility_off,color: Colors.amber,):Icon(Icons.visibility,color: Colors.amber,),
                          ),
                          labelText:"Conform-Password",
                          hinttext:"Retype password"
                      ),
                      SizedBox(height: 12),
                      fbutton(
                        title:"SIGN UP NOW",
                        isLoginButton: false,
                        onPress: (){
                          widget.submit(context);
                          //Navigator.push(context, MaterialPageRoute(builder:(_)=>LoginPage()));
                        },),
                    ],),
                ),
              )),
        ),
      ),


    );
  }
}

//
