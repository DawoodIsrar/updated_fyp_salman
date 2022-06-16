import 'package:flutter/material.dart';


import 'package:footballapp/widgets/drawer_page.dart';

import '../widgets/app_bar.dart';

class All_Leagues extends StatelessWidget {
  const All_Leagues({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar( title: "ALL Leagues Page",
        backgrounColor: Colors.blueAccent,),
      drawer: My_Drawer(),
      body: Center(
        child: Text("All Leagues"),
      ),
    );
  }
}
