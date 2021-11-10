import 'package:flutter/material.dart';

class CategoriesView extends StatefulWidget {
  final List<String> players;

  const CategoriesView(this.players);
  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('Categories View'),
      )
    );
  }
}