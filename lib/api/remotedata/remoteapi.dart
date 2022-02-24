import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:testeui/api/models/GetLogin.dart';
import 'package:testeui/api/models/GetModel.dart';
import 'package:testeui/api/models/de.dart';
import 'package:testeui/core/apistring/apistring.dart';

class Authentication{

  Dio dio = Dio();
 Future<De> Login() async{
    var response = await dio.post(baseurl+listuser,data: {
      "email": "eve.holt@reqres.in",
      "password": "123456"
    });
print(response.statusCode);
    if(response.statusCode == 200){
      print(response.data);
       De.fromJson(response.data);
    } throw Exception('Failed to loads user');
  }

  Future<GetLogin> Register() async{
    var response = await dio.get(baseurl+listuser);
    print(response.statusCode);
    if(response.statusCode == 200){
      GetLogin.fromJson(response.data);
    } throw Exception('Failed to loads user');
  }


}

