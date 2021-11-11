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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('A propos', textAlign: TextAlign.center, style: TextStyle(color: Colors.orange, fontSize: 35, fontWeight: FontWeight.bold,)),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 40),
              child: Column(
                children: <Widget>[
                  Text('Cette application a été réalisée dans le cadre du labo flutter (ydays 2021 Ynov).\n',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.local_drink),
                          title: Text('Nombre de cafés'),
                          subtitle: Text('443')
                        )
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.local_drink_outlined),
                          title: Text('Nombre de bières'),
                          subtitle: Text('626')
                        )
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.developer_board),
                          title: Text('Github'),
                          subtitle: Text('https://github.com/HenriGourgue/picolal_front\nhttps://github.com/HenriGourgue/picolal_back')
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Text(
                      'Made with ❤️ by Henri Gourgue',
                      textAlign: TextAlign.center
                    ),
                  )
                ],
              ),
            )
          ],
        )
      )
    );
  }

}