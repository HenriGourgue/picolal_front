import 'package:flutter/material.dart';
import 'package:picolal_front/Rule.dart';

class FavoritesView extends StatefulWidget{
  @override
  _FavoritesViewState createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {

  List<Rule> rules = [];

  void callback(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('Favorites View'),
      )
    );
  }
}