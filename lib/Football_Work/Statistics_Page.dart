import 'package:flutter/material.dart';


import '../widgets/app_bar.dart';
import '../widgets/drawer_page.dart';

class Statistic_Page extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: My_Drawer(),
      appBar: CustomAppBar(
        title: "Statistic Page",
        backgrounColor: Colors.amber,
      ),
      body: CustomScrollView(
        slivers: [
          //HeaderContainer(),

        ],


      )
    );
  }
}


Widget teamStat(String team, String logoUrl, String teamName) {
  return Expanded(
    child: Column(
      children: [
        Text(
          team,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: Image.network(
            logoUrl,
            width: 54.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          teamName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ],
    ),
  );
}