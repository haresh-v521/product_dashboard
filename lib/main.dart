import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:testeui/screen/demoapi.dart';
import 'package:testeui/screen/demojsonplaceholder.dart';
import 'package:testeui/screen/editprofile.dart';
import 'package:testeui/screen/fakestoreapi.dart';
import 'package:testeui/screen/homepage.dart';
import 'package:testeui/screen/loginscreen.dart';
import 'package:testeui/screen/notification.dart';
import 'package:testeui/screen/phoneauth.dart';
import 'package:testeui/screen/productdetailes.dart';
import 'package:testeui/screen/productlist.dart';
import 'package:testeui/screen/profile.dart';
import 'package:testeui/screen/signup.dart';

import 'api/models/DemoApi.dart';
import 'firebase/notificationservice/local_notification_service.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();
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
        // '/': (context) =>  const PuchNotification(),
        // // '/': (context) => const FakeStoreApi(),
        // // '/': (context) => const UserJsonPlace(),
        // // '/': (context) => const DemoApii(),
        '/': (context) => const PhoneAuthentication(),
        // '/': (context) => const HomePage(),
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