import 'dart:convert';
import 'dart:io';
import 'package:picolal_front/Category.dart';
import 'package:picolal_front/Rule.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  static const String endpoint = "http://localhost:8000/api/";

  static Future<List<Category>> getCategories() async {

    final res = await http.get(Uri.parse(endpoint + "categories"));

    if (res.statusCode != 200){
      throw Error();
    }

    final jsonBody = json.decode(res.body);
    final List<Category> categories = [];

    categories.addAll((jsonBody as List).map((category) => Category.fromJson(category)).toList());

    return categories;
  }

  static Future<List<Rule>> getRulesByCat(Category cat) async {

      final res = await http.get(endpoint + "category/" + cat.name + "/rules");

      print(res.statusCode);

      if (res.statusCode != 200) throw Error();

      final jsonBody = json.decode(res.body);
      final List<Rule> rules = [];

      rules.addAll((jsonBody as List).map((rule) => Rule.fromJson(rule)).toList());

      return rules;
  }
}