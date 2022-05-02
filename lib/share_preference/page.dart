import 'package:flutter/material.dart';
import 'package:my_project/share_preference/global.dart';
import 'package:my_project/share_preference/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('${Global.finalEmail}'),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: ()async{
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.remove('email');
                Navigator.push(context, MaterialPageRoute(builder: (c)=>const LoginPage()));
                print("User ${Global.finalEmail} Remove" );
                setState(() {

                });
              }, child: const Text('Log Out'))
            ],
          ),
        ],
      ),
    );
  }
}
