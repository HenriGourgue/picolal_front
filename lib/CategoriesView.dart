// ignore_for_file: missing_return

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:picolal_front/ApiServices.dart';
import 'package:picolal_front/Category.dart';
import 'package:picolal_front/CategoryCard.dart';

class CategoriesView extends StatefulWidget {

  final List<String> players;

  const CategoriesView(this.players);
  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  

  @override
  Widget build(BuildContext context) {
    stderr.write('test');
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Choisissez votre\nmood", style: TextStyle(color: Colors.orange, fontSize: 35, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 40),
                  child: Column(
                    children: <Widget>[
                      FutureBuilder(
                        future: ApiServices.getCategories(),
                        builder: (context, snapshot) {

                          switch(snapshot.connectionState){

                            case ConnectionState.waiting:
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                              break;

                            case ConnectionState.done:
                              if(snapshot.hasError){
                                return Center(
                                  child: Text(
                                    "Une erreur est survenue."
                                  ),
                                );
                              }

                              if(snapshot.hasData){
                                List<Category> categories = snapshot.data;
                                if(categories.isEmpty) {
                                  stderr.write('test');
                                  return Center(
                                    child: Text(
                                        "Il n'y a pas de catégories."
                                    ),
                                  );
                                } else {
                                  stderr.write('test');
                                  return Container(
                                    height: MediaQuery.of(context).size.height * 0.6,
                                    child: ListView.builder(
                                      itemCount: categories.length,
                                      itemBuilder: (context, index){
                                        return CategoryCard(category: categories.elementAt(index), players: widget.players);
                                      }
                                    )
                                  );
                                }
                              } else {
                                stderr.write('test');
                                return Container(
                                  child: Text(
                                    "Aucune donnée"
                                  ),
                                );
                              }
                              break;
                            case ConnectionState.none:
                              // TODO: Handle this case.
                              stderr.write('test');
                              break;
                            case ConnectionState.active:
                              // TODO: Handle this case.
                              stderr.write('test');
                              break;
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        )
      )
    );
  }
}