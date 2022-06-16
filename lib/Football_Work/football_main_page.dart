import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/drawer_page.dart';



class FootballMainPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
      ],
    );
    return Scaffold(
      appBar:new CustomAppBar( title: "SoccreBoard",
        backgrounColor: Colors.black45,),
      drawer: My_Drawer(),




    );
  }
}
