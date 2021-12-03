
import 'package:flutter/material.dart';


import 'Issuereport.dart';


enum ImageSourceType { gallery, camera }

class Issuereporting extends StatelessWidget {
  void _handleURLButtonPress(BuildContext context, var type) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => issuereport(type)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Issue reporting home"),
        ),
        body: Center(
          child: Column(
            children: [
              MaterialButton(
                color: Colors.blue,
                child: Text(
                  "lanch a issue report from Gallery",
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  _handleURLButtonPress(context, ImageSourceType.gallery);
                },
              ),
              MaterialButton(
                color: Colors.blue,
                child: Text(
                  "lanch a issue report Camera",
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  _handleURLButtonPress(context, ImageSourceType.camera);
                },
              ),
            ],
          ),
        ));
  }
}