import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


// create a user class to declare all the values that will be inputed
class User {

  final String name;
  final String address;
  final int age;
  final String gender ;
  final String job_title;
  final String job_description;
  final String email;
  final String phone;
  final String office_location;

  User({
    required this.name,
    required this.address,
    required this.age,
    required this.gender,
    required this.job_title,
    required this.job_description,
    required this.email,
    required this.phone,
    required this.office_location,
  });
}

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
//Applying get request.

  String _searchText = "";
  Icon _searchIcon = new Icon(Icons.search);
  //final dio = new Dio();


  Future<List<User>> getRequest() async {


    String BaseURL = "http://10.0.2.2:8000/api/contactlist";

    final Uri url = Uri.parse(BaseURL);

    final response = await http.get(url);

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<User> users = [];

    for (var singleUser in responseData) {
      User user = User(
        //id: singleUser["id"],
        name: singleUser["username"],
        address: singleUser["address"],
        age: singleUser["age"],
        gender: singleUser["gender"],
        job_title: singleUser["Job title"],
        job_description: singleUser["Description"],
        email: singleUser["Email"],
        phone: singleUser["Phone"],
        office_location:singleUser["location"],

      );

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
          leading: Icon(
            Icons.email,
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
                    title: Text(snapshot.data[index].username),
                    subtitle: Text(snapshot.data[index].Description),
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