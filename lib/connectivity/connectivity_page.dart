import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConnectivityPage extends StatefulWidget {
  const  ConnectivityPage({
    Key? key,
  }) : super(key: key);

  @override
  _ConnectivityPageState createState() => _ConnectivityPageState();
}

class _ConnectivityPageState extends State<ConnectivityPage> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  bool? netStatus = true;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();


    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  bool isDialogOpen = false;

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      if (result == ConnectivityResult.none) {
        print(_connectionStatus);
        isDialogOpen = true;
        Future.delayed(const Duration(seconds: 1), () {
          showDialog(
            context: context,
            builder: (_) =>  AlertDialog(title: Text("$_connectionStatus")),
          );});
      } else if(result == ConnectivityResult.wifi || result == ConnectivityResult.mobile){
       if(isDialogOpen){
         Navigator.pop(context);
       }
      }
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connectivity example app'),
      ),
    );
  }
}
