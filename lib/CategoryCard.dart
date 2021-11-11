import 'package:flutter/material.dart';
import 'package:picolal_front/ApiServices.dart';
import 'package:picolal_front/Category.dart';
import 'package:picolal_front/DrunkView.dart';
import 'package:picolal_front/Rule.dart';

class CategoryCard extends StatelessWidget {

  final Category category;
  final List<String> players;

  const CategoryCard({Key key, this.category, this.players}) : super(key: key);

  void _goToDrunkView(BuildContext context) {

  }

  @override
  Widget build(BuildContext context) {
    return Text('TEST');
  }
}