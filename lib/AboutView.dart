import 'package:flutter/material.dart';

class AboutView extends StatefulWidget{
  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {

  void callback(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('About View'),
      )
    );
  }

}