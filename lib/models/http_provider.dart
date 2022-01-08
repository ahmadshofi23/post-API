import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  int get jumlahData => _data.length;

  void connectApi(String name, String job) async {
    Uri url = Uri.parse("https://reqres.in/api/users");

    var hasilresponse = await http.post(
      url,
      body: {
        "name": name,
        "job": job,
      },
    );

    _data = json.decode(hasilresponse.body);
    notifyListeners();
  }
}
