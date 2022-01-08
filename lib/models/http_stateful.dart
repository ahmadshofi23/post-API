import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStateful {
  String? id, name, job, createdAt;
  HttpStateful({
    this.id,
    this.name,
    this.job,
    this.createdAt,
  });

  static Future<HttpStateful> conncetApi(String name, String job) async {
    Uri url = Uri.parse("https://reqres.in/api/users");

    var hasilresponse = await http.post(
      url,
      body: {
        "name": name,
        "job": job,
      },
    );

    var dataJson = json.decode(hasilresponse.body);

    return HttpStateful(
      id: dataJson["id"],
      name: dataJson["name"],
      job: dataJson["job"],
      createdAt: dataJson["createdAt"],
    );
  }
}
