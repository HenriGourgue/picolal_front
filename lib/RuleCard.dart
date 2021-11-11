import 'package:flutter/material.dart';
import 'package:picolal_front/Rule.dart';

class RuleCard extends StatefulWidget {
  
  Rule rule;
  Function callback;
  RuleCard({Key key, this.rule, this.callback }) : super(key: key);

  @override
  _RuleCardState createState() => _RuleCardState();
}

class _RuleCardState extends State<RuleCard> {

  @override
  Widget build(BuildContext context) {
    return Text('TEST');
  }
}