import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:testeui/screen/editprofile.dart';
import 'package:testeui/screen/homepage.dart';
import 'package:testeui/screen/loginscreen.dart';
import 'package:testeui/screen/productdetailes.dart';
import 'package:testeui/screen/productlist.dart';
import 'package:testeui/screen/profile.dart';
import 'package:testeui/screen/signup.dart';

import 'api/remotedata/remoteapi.dart';

void main() async {
  var respone = await   Authentication().Login();
  print(respone.token);
  runApp(


    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUPScreen(),
        '/profile': (context) => const Profile(),
        '/editprofile': (context) => const EditProfile(),
        '/productlist': (context) => const ProductList(),
        '/productdetails': (context) => const ProductDetails(),
      },
    );
  }
}