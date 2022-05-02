import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/share_preference/global.dart';
import 'package:my_project/share_preference/page.dart';
import 'package:my_project/src/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SharedPreferences Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: emailCont,
              hint: 'Enter Email',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: passCont,
              hint: 'Enter Password',
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setString('email', emailCont.text);
                print(Global.finalEmail);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const MyPage()),
                );
                // Map data = {"email": emailCont.text, "pass": passCont.text};
                // pref.setString('data', jsonEncode(data));
                //
                // String xy = pref.getString('data')!;
                // Map newData = jsonDecode(xy);
                // print(newData['pass']);
                setState(() {

                });
              },
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;

  const CustomTextField({Key? key, this.hint, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hint),
    );
  }
}
