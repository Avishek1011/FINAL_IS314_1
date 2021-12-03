import 'package:flutter/material.dart';

import 'cyclone_ready.dart';



class DetailScreen1 extends StatelessWidget {


  final cyclonelist note;

  const DetailScreen1({required this.note});

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