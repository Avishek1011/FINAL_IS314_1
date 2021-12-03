
import 'package:flutter/material.dart';

import 'FirstaidHome.dart';

class DetailScreen extends StatelessWidget {


  final firstlist note;

  const DetailScreen({required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),


      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),

              Text(
                note.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(note.title),
              Text(note.comments),
              Text(note.name),
              Text(note.path),
            ],
          ),
        ),
      ),
    );
  }
}