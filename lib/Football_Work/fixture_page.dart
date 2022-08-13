import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/drawer_page.dart';

class Fixture_Page extends StatelessWidget {
  const Fixture_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Fixture"),
      ),
      appBar: CustomAppBar( title: "Fixtures Page",
        backgrounColor: Colors.amber,),
      drawer: My_Drawer(),
       );
  }
}
