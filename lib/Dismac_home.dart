import 'package:flutter/material.dart';
import 'dart:math';

import 'FirstaidHome.dart';
import 'cyclone_ready.dart';


class DismacHomePage extends StatefulWidget {
  final String title;

  DismacHomePage({this.title = 'Dismac Material'});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DismacHomePage> {
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
    var heading = 'First aid';
    var subheading =
        'View Lastest Information';
    var supportingText =
        ' View Lastest Information about the first aid kit ';
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

              Image.asset('assets/images/firstaid.jpg'),
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
                  child: const Text('View Information'),
                  onPressed: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>firstaid()),
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
    var heading = 'Cyclone Ready';
    var subheading =
        'View Lastest Information';
    var supportingText =
        ' View Lastest Information about Cyclone Ready';
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
              Image.asset('assets/images/c_r_1.jpg'),
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
                  child: const Text('View Information'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>cyclone_ready()),
                    );
                  },
                )
              ],
            )
          ],
        ));
  }


}
