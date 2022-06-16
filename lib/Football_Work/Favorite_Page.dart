import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/drawer_page.dart';

class Favorite_page extends StatelessWidget {
  const Favorite_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: My_Drawer(),

      body: Center(
        child: Text("Favorite Page"),
      ),
      appBar: CustomAppBar( title: "Favorite Page",
        backgrounColor: Colors.redAccent,),
      );
  }
}
