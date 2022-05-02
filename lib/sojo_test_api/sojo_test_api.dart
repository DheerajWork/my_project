import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import 'package:permission_handler/permission_handler.dart';
//
//
// class SojoApiScreen extends StatefulWidget {
//   const SojoApiScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SojoApiScreen> createState() => _SojoApiScreenState();
// }
//
// class _SojoApiScreenState extends State<SojoApiScreen> {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     Permission.camera.request();
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           child: const Text(''),
//           onPressed: ()async{
//             await Permission.camera.request();
//           },
//         ),
//       ),
//     );
//   }
// }


class SojoApiScreen extends StatefulWidget {
  const SojoApiScreen({Key? key}) : super(key: key);

  @override
  State<SojoApiScreen> createState() => _SojoApiScreenState();
}

class _SojoApiScreenState extends State<SojoApiScreen> {

  Future getData()async{
    Map data = {
      "firebaseId": "G8K5fn7agMUOzzMYN6mPyzrAPVh2",
    "crop_filter":"all",
    "search_value":"",
    "pageno":"1"
    };

    http.Response response = await http.post(Uri.parse('testapi.sojo.com.my/api/post/getPostLists.php'),body: data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ,
    );
  }
}

