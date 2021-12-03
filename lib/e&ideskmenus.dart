import 'package:flutter/material.dart';
import 'package:usp_mobileapp/Issuereport.dart';

import 'Contact_update.dart';
import 'Dismac_home.dart';
import 'Firstaid.dart';
import 'ReportingHome.dart';


class menus extends StatelessWidget {
  const menus({Key? key}) : super(key: key);

  static const String _title = 'USP MOBILE APP';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: report_form(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
/// This is the stateful widget that the main application instantiates.
///

class report_form extends StatefulWidget {
  final String title;

  report_form({this.title = 'E & I DESK'});

  //const report_form({Key? key}) : super(key: key);

  @override
  State<report_form> createState() => _MyeiDeskstates();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyeiDeskstates extends State<report_form> {
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
                  buildCard3(),
                ],
              )),
        ));
  }



  Card buildCard() {

    var heading = 'Issue Report';

    var supportingText =
        ' Report any issue , upload image , description ';
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(heading),

              trailing: Icon(Icons.announcement),
            ),
            Container(
              height: 200.0,
              child:

              Image.asset('assets/images/report_check.jpg'),
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
                  child: const Text('Issue'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Issuereporting()),
                    );
                    },
                )
              ],
            )
          ],
        ));
  }

  // CARD FOR DISMAC MATERILAS

  Card buildCard2() {
    var heading = 'Dismac Materials and OHS';

    var supportingText =
        ' View lastest update of the usp ,Dismac material, first-aid, cyclone ready';
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(heading),
              trailing: Icon(Icons.add_alert_sharp),
            ),
            Container(
              height: 200.0,
              child:
              //Ink.image(
              //image: cardImage,
              //fit: BoxFit.cover,
              Image.asset('assets/images/issue_icon.jpg'),
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
                  child: const Text('View alert information'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DismacHomePage()),
                    );
                  },
                )
              ],
            )
          ],
        ));
  }


  Card buildCard3() {

    var heading = 'Contact';

    var supportingText =
        'View Contacts and update contacts details';
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(heading),
              trailing: Icon(Icons.warning_amber_outlined),
            ),
            Container(
              height: 200.0,
              child:
              //Ink.image(
              //image: cardImage,
              //fit: BoxFit.cover,
              Image.asset('assets/images/contact_icons.png'),
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
                  child: const Text('View Contact '),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactPage()),
                    );
                  },
                )
              ],
            )
          ],
        ));
  }
}
