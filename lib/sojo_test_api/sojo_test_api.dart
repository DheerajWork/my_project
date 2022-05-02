import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


class SojoApiScreen extends StatefulWidget {
  const SojoApiScreen({Key? key}) : super(key: key);

  @override
  State<SojoApiScreen> createState() => _SojoApiScreenState();
}

class _SojoApiScreenState extends State<SojoApiScreen> {



  @override
  Widget build(BuildContext context) {
    Permission.camera.request();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text(''),
          onPressed: ()async{
            await Permission.camera.request();
          },
        ),
      ),
    );
  }
}
