import 'package:flutter/material.dart';
import 'package:usp_mobileapp/security_main.dart';
import 'dart:math';

import 'e&ideskmenus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Usp Mobile App'
          ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({this.title = 'Demo'});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  buildCard(),
                  buildCard2(),
                ],
              )),
        ));
  }

  Card buildCard() {
    var ran = Random();
    var heading = 'Security';
    var subheading =
        'Alert safety location';
    var supportingText =
        ' Report emergency/danger, safe alerts location to   the security to take action';
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(heading),
              subtitle: Text(subheading),
              trailing: Icon(Icons.warning_amber_outlined),
            ),
            Container(
              height: 200.0,
              child:

                Image.asset('assets/images/security_icon.jpg'),
            ),
    //),
            Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(supportingText),
            ),
            ButtonBar(
              children: [
                TextButton(
                  child: const Text('Send alert'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>Securitypage()),
                    );
                    },
                )
              ],
            )
          ],
        ));
  }

  Card buildCard2() {
    var ran = Random();
    var heading = 'E&I DESK';
    var subheading =
        'Issue reporting , Dismac materials and contacts';
    var supportingText =
        ' Inform report , View Dismac materials , OHS annd contacts';
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(heading),
              subtitle: Text(subheading),
              trailing: Icon(Icons.warning_amber_outlined),
            ),
            Container(
                height: 200.0,
                child:
                //Ink.image(
                //image: cardImage,
                //fit: BoxFit.cover,
                Image.asset('assets/images/firstaid.jpg'),
            ),
            // ),
            Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(supportingText),
            ),
            ButtonBar(
              children: [
                TextButton(
                  child: const Text('View Details'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>menus()),
                    );
                  },
                )
              ],
            )
          ],
        ));
  }


}
