import 'dart:convert';

import 'package:demoapp_15_04/Model/model3.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ViewModel3 extends ChangeNotifier {
  List<Model3> ProductData = [];
  Future<List<Model3>> fetchData() async {
    final response = await http.get(
        Uri.parse('https://mocki.io/v1/7888b83e-7752-47b9-98fa-e23015a0396c'));

    try {
      List<dynamic> responseDataof = jsonDecode(response.body);

      ProductData =
          responseDataof.map((item) => Model3.fromJson(item)).toList();
      return ProductData;
    } catch (e) {
      throw Exception('failed to Load details');
    }
  }
}
