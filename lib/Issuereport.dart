import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'ReportingHome.dart';



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

  ImageFromGalleryExState(this.type);

  var isstype = TextEditingController();
  var descriciption = TextEditingController();

  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(type == ImageSourceType.camera
              ? "Image from Camera"
              : "Image from Gallery")),
      body:


      Column(
        children: <Widget>[

          SizedBox(
            height: 100,
          ),

          TextFormField(
            controller: isstype,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Enter the issue tittle',
              labelText: 'Title *',
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
          SizedBox(
            height: 52,
          ),


          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                // Validate returns true if the form is valid, or false otherwise.

                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );

                senddata();
              },

              child: const Text('Submit'),
            ),
          ),

          Center(
            child: GestureDetector(
              onTap: () async {
                var source = type == ImageSourceType.camera
                    ? ImageSource.camera
                    : ImageSource.gallery;
                XFile image = await imagePicker.pickImage(
                    source: source, imageQuality: 50, preferredCameraDevice: CameraDevice.front);
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
          )


        ],
      ),
    );


  }


// Send data to the portal through api

  Future<void> senddata() async {


    final String BaseURL = 'http://127.0.0.1:8000/api/Report/';

    final Uri url = Uri.parse(BaseURL);

    var response = await http.post(url,
        body: ({
          'Title': isstype.text,
          'Description': descriciption.text,
          'url':_image,

        }));


    print(response.statusCode);

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(' Data Sent')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Issuereporting()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Failed')),
      );
    }
  }

}
