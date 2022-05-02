import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:my_project/api_testing/home_screen.dart';
import 'package:my_project/cached_netwoek_img/network_img.dart';
import 'package:my_project/connectivity/connectivity_page.dart';
import 'package:my_project/sojo_test_api/sojo_test_api.dart';
import 'package:permission_handler/permission_handler.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:  const SojoApiScreen(),
    );
  }
}
