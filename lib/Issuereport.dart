import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'ReportingHome.dart';

// class for data to be posted
class reportalert {

  final String isstype;
  final String descriciption;
  File image;

  reportalert({required this.isstype, required this.descriciption, required this.image});

  factory reportalert.fromJson(Map<String, dynamic> json) {
    return reportalert(
      isstype: json['addrlocation'],
      descriciption: json['descriciption'],
      image: json['_image'],
    );
  }
}

class issuereport extends StatefulWidget {
  final type;
  issuereport(this.type);

  @override
  ImageFromGalleryExState createState() => ImageFromGalleryExState(this.type);
}

class ImageFromGalleryExState extends State<issuereport> {
  var _image;
  var imagePicker;
  var type;
  Future<reportalert>? _futurereport;

  ImageFromGalleryExState(this.type);
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _isstype = TextEditingController();

  final TextEditingController descriciption = TextEditingController();


  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(
            height: 50,
          ),

          TextFormField(
            controller: _isstype,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Enter the issue Titte',
              labelText: 'Titte *',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          TextFormField(
            controller: descriciption,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Enter descriciption information ',
              labelText: 'Descriciption*',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          GestureDetector(
            onTap: () async {
              var source = type == ImageSourceType.camera
                  ? ImageSource.camera
                  : ImageSource.gallery;
              XFile image = await imagePicker.pickImage(
                  source: source,
                  imageQuality: 50,
                  preferredCameraDevice: CameraDevice.front);
              setState(() {
                _image = File(image.path);
              });
            },
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.red[200]),
              child: _image != null
                  ? Image.file(
                _image,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.fitHeight,
              )
                  : Container(
                decoration: BoxDecoration(
                    color: Colors.red[200]),
                width: 200,
                height: 200,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.grey[800],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );

                  _futurereport = createissuealert(_isstype.text, descriciption.text, _image);
                  //_futurereport = createissuealert(_isstype.text, descriciption.text, image);
                }
              },
              child: const Text('Submit Report '),
            ),
          ),
        ],
      ),
    );


// Send data to the portal through api

  }

  // post method
  Future<reportalert> createissuealert(String _isstype , String description ,File image  ) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/securityadd'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        '_isstype': _isstype,
        'description': description,
        'image': image.path,
        
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(' Data Sent successfully')),
      );
      return reportalert.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Alert failed')),
      );
      throw Exception('Failed to create report.');
    }
  }

}
