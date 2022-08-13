import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footballapp/models/soccer.dart';

import '../services/soccer.dart';
import '../widgets/body.dart';
import '../widgets/drawer_page.dart';

class FootballMainPage extends StatelessWidget {

  var match = SoccerApi().getAllMatches();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0.0,
        title: Text(
          "SOCCERBOARD",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      drawer: My_Drawer(),
      body: FutureBuilder<List<SoccerMatch>?>(
        future: SoccerApi().getAllMatches(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("data received");
            print(snapshot.data);
            return pageBody(snapshot.data);
          } else {
            //print(snapshot.data!.first.home.name);
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
