// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:demoapp_15_04/Model/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewModel extends ChangeNotifier {
  List<Model> DataAdd = [];

  List<Model> ProdDataAdd = [];

  int counter = 0;

  var counterdata = 0;

  List<Model> PriceDetails = [];

  Future<List<Model>> fetchDetails() async {
    final response = await http.get(
      Uri.parse('https://mocki.io/v1/b3573d1e-c5ed-4786-9609-d4bc8077edd0'),
    );
    try {
      List<dynamic> responseData = jsonDecode(response.body);
      DataAdd = responseData.map((item) => Model.fromJson(item)).toList();

      return DataAdd;
    } catch (e) {
      throw Exception('Failed To Load Details');
    }
  }

  void DataItems(Model ModelCls) {
    if (ProdDataAdd.contains(ModelCls)) {
      ProdDataAdd.remove(ModelCls);
      notifyListeners();
    } else {
      ProdDataAdd.add(ModelCls);
      notifyListeners();
    }
  }

  void RemoveItems(Model Dataset) {
    ProdDataAdd.remove(Dataset);
    notifyListeners();
  }

  void CounterInc(Model inc) {
    counter = counter + 1;
    print(counter = counter++);
    notifyListeners();
  }

  void CounterDec(Model dec) {
    if (counter > 0) {
      counter = counter--;
      print(counter = counter - 1);
      notifyListeners();
    }
  }

  void CounterStat(Model Stat) {
    if (counter > 0) {
      counter = counter = 0;
      notifyListeners();
    }
  }

  void PriceAdd(Model pricecalc) {
    if (counter > 0) {
      counterdata = counter * 2;
      print(counter = counter * 2);
      notifyListeners();
    }
  }
}
