import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:picolal_front/FavoritesView.dart';
import 'package:picolal_front/CategoriesView.dart';
import 'package:picolal_front/AboutView.dart';

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
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showMyDialog();
    });
  }

  void _goToCategoriesView(BuildContext context) {
    if(player1.text == "" && player2.text == "" && player3.text == "" && player4.text == "" && player5.text == "") {
      this._showPlayerAlert();
    } else {
      if (player1.text != "")
        players.add(player1.text);
      if (player2.text != "")
        players.add(player2.text);
      if (player3.text != "")
        players.add(player3.text);
      if (player4.text != "")
        players.add(player4.text);
      if (player5.text != "")
        players.add(player5.text);

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => CategoriesView(players),
        ),
      );
    }
  }

  Future<void> _showPlayerAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Solo ?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Vous ne pouvez jouer sans joueur.'),
                Text(''),
                Text('Vous devez entrer au moins un joueur.'),
              ],
            )
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("D'accord"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }

  void _goToFavoritesView(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => FavoritesView()
      )
    );
  }

  void _goToAboutView(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => AboutView()
      )
    );
  }

  Future<void> _showMyDialog() async {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Picolal',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 60,
                    fontWeight: FontWeight.bold
                  ),
                )
              ]
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 40),
                  child: Form(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextField(
                            controller: player1,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Nom joueur 1'
                            ),
                          ),
                          TextField(
                            controller: player2,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Nom joueur 2'
                            ),
                          ),
                          TextField(
                            controller: player3,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Nom joueur 3'
                            ),
                          ),
                          TextField(
                            controller: player4,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Nom joueur 4'
                            ),
                          ),
                          TextField(
                            controller: player5,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Nom joueur 5'
                            ),
                          ),
                        ]
                      ),
                    )
                  ),
                ),
              ]
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.52,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 10, left: 35, right: 35),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: FloatingActionButton(
                      heroTag: "button1",
                      tooltip: 'Mes favoris',
                      child: Icon(Icons.star, color: Colors.amber),
                      onPressed: () async {
                        this._goToFavoritesView(context);
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FloatingActionButton(
                      heroTag: "button2",
                      tooltip: 'A propos',
                      child: Icon(Icons.help),
                      onPressed: () async {
                        this._goToAboutView(context);
                      },
                    )
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      heroTag: "button3",
                      tooltip: 'Se la mettre',
                      onPressed: () => {
                        this._goToCategoriesView(context)
                      },
                      child: Icon(Icons.play_arrow, color: Colors.lightGreenAccent),
                    ),
                  )
                ]
              ),
            )
          ],
        ),
      )
    );
  }

}