import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_project/share_preference/global.dart';
import 'package:my_project/share_preference/login_screen.dart';
import 'package:my_project/share_preference/page.dart';
import 'package:my_project/src/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  Future getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var emailData = pref.getString('email');
    setState(() {
      Global.finalEmail = emailData;
    });
    print(Global.finalEmail);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData().whenComplete(() async {
      Timer(const Duration(seconds: 100), () =>
          Navigator.push(context, MaterialPageRoute(builder: (c) =>
          Global.finalEmail == null
              ? const LoginPage()
              : const MyPage())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}
