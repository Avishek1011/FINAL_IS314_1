import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'Cyclone_ready_detailed.dart';
import 'Firstaid.dart';


class cyclone_ready extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cyclone Ready Inform',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListScreen1(),
    );
  }
}


class cyclonelist {

  final DateTime updated_at;
  final String title;
  final String comments;
  final String name;
  final String path;


  cyclonelist({
    required this.updated_at,
    required this.title,
    required this.comments,
    required this.name,
    required this.path,

  });
}

class ListScreen1 extends StatelessWidget
{


  Future<List<cyclonelist>> getRequest() async {


    String BaseURL = "http://127.0.0.1:8000/api/cyclonereadylist";

    final Uri url = Uri.parse(BaseURL);

    final response = await http.get(url);

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<cyclonelist> crlist = [];

    for (var singleUser in responseData) {
      cyclonelist cinform = cyclonelist(
        //id: singleUser["id"],
        updated_at: singleUser["updated_at"],
        title: singleUser["title"],
        comments: singleUser["comments"],
        name: singleUser["name"],
        path: singleUser["path"],

      );

      //Adding user to the list.
      crlist.add(cinform);
    }
    return crlist;
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cyclone Ready Information"),
          leading: Icon(
            Icons.get_app,
          ),
        ),

        body: Container(
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: getRequest(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {

              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),

                  ),
                );


              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (ctx, index) => ListTile(

                    title: Text(snapshot.data[index].title),
                    subtitle: Text(snapshot.data[index].comments),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen1(note: snapshot.data[index]),
                        ),
                      );
                    },
                    contentPadding: EdgeInsets.only(bottom: 20.0),
                  ),
                );

              }
            },
          ),
        ),
      ),
    );
  }
}

