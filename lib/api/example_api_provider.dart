import 'dart:convert';
import 'dart:developer';
import 'package:block_example/model/covid_model.dart';
import 'package:http/http.dart' as http;
import 'package:block_example/model/example_model.dart';
import 'package:http/http.dart';

class ApiExample{
  String covidUrl = 'https://api.covid19api.com/summary';
  String userURL = "https://dummyjson.com/users";

  Future<CovidModel> getCovidInfo() async {
    Response response = await http.get(Uri.parse(covidUrl));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      CovidModel returnedData = CovidModel.fromJson(result);
      return returnedData;

    } else {
      print("error");
      throw Exception(response.reasonPhrase);

    }
  }
  Future<UserDetailsModel> getUsers() async {
    Response response = await http.get(Uri.parse(userURL));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      UserDetailsModel returnedData = UserDetailsModel.fromJson(result);
      return returnedData;

    } else {
      print("error");
      throw Exception(response.reasonPhrase);

    }
  }
}
