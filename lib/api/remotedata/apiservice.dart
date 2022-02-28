import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:testeui/api/models/login.dart';


List jaydeep = [
  {
    "email": "eve.holt@reqres.in",
    "password": "cityslicka"
  }
];

class ApiServices{
Dio dio = Dio();
  Future <Login> apiCallLogin(Map<String, String> jaydeep) async{

    var url = Uri.parse('https://reqres.in/api/login');
    var response = await dio.post("https://reqres.in/api/login",data: jaydeep);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');

    return Login.fromJson(response.data);

  }
}