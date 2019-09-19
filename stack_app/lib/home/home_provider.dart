import 'package:stack_app/home/index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeProvider {
  HomeProvider();

  Future<QuestionData> getData() async {
    var res = await http
        .get("http://127.0.0.1:8000/api/questions/?format=json");
    var decodedJson = jsonDecode(res.body);

    QuestionData qd = QuestionData();
    qd.questions = [];
    for (var json in decodedJson) {
      qd.questions.add(Questions.fromJson(json));
    }

    return qd;
  }
}