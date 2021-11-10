import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController player1 = new TextEditingController();
  TextEditingController player3 = new TextEditingController();
  TextEditingController player4 = new TextEditingController();
  TextEditingController player2 = new TextEditingController();
  TextEditingController player5 = new TextEditingController();

  List<String> players = [];

  @override
  void initState(){
    stderr.writeln('initState');
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showMyDialog();
    });
  }

  Future<void> _showMyDialog() async {
    stderr.writeln('_showMyDialog');
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Informations'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('L’abus d’alcool est dangereux pour la santé.'),
                Text(''),
                Text('À consommer avec modération.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Approuver'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Text(('TEST')),
      )
    );
  }

}