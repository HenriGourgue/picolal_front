import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picolal_front/ApiServices.dart';
import 'package:picolal_front/Category.dart';
import 'package:picolal_front/Rule.dart';
import 'package:picolal_front/Home.dart';
import 'dart:math';
import 'package:picolal_front/Database_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DrunkView extends StatefulWidget {
  final Category category;
  final List<String> players;
  final List<Rule> rules;

  DrunkView(this.category, this.players, this.rules);

  @override
  _DrunkViewState createState() => _DrunkViewState(this.players);
}

class _DrunkViewState extends State<DrunkView> {

  int currentIndex;
  String currentPlayer;
  List<String> players;
  _DrunkViewState(this.players);
  final DatabaseHelper db = DatabaseHelper.instance;

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    this._delete();
  }

  void initRules(List<Rule> rules){
    Random random = new Random();
    int randomNumber = random.nextInt(rules.length);
    int randomNumber2 = random.nextInt(this.players.length);

    this.currentPlayer = this.players[randomNumber2];
    this.currentIndex = randomNumber;
    print("init rules : " + widget.rules.toString());
  }

  int randomInt(){
    Random random = new Random();
    return random.nextInt(widget.rules.length);
  }

  void refreshRule(){
    if(widget.rules.length > 1){
      widget.rules.removeAt(this.currentIndex);
      this.currentIndex = randomInt();
      setState(() {

      });
    } else {
      print("NO MORE RULES");
      this._goToHomeView(context);
    }
  }

  void _goToHomeView(BuildContext context) {

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => MyHomePage(),
      ),
    );
  }

  void _delete() async {

    final id = await db.queryRowCount();

    for(int i = 1 ; i <= id ; i++){

      final rowsDeleted = await db.delete(i);
      print('deleted $rowsDeleted row(s): row $i');
    }
  }

  void insertDb(Rule rule) async {

    bool exists = false;
    Color color = Colors.green;
    String toastmsg = rule.name + " added to favorites";
    final allRows = await db.queryAllRows();

    allRows.forEach((row) => {
      if(row["name"] == rule.name){
        exists = true
      }
    });
    
    if(!exists){

      Map<String, dynamic> row = {
        DatabaseHelper.columnName : rule.name,
        DatabaseHelper.columnContent : rule.content,
        DatabaseHelper.columnDrinks : rule.drinks
      };
      
      final id = await this.db.insert(row);
      print('inserted row id: $id');
    } else {

      color =Colors.orange;
      toastmsg = rule.name + " already added to favorites";
    }

    Fluttertoast.showToast(
        msg: toastmsg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    initRules(widget.rules);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color.fromRGBO(52, 73, 94, 1.0),
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                Text('TEST')
              ]
            )
          ),
        ),
      ),
    );
  }
}