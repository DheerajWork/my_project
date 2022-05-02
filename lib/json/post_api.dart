import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_project/json/model_class/post_model.dart';

class PostApi extends StatefulWidget {
  const PostApi({Key? key}) : super(key: key);

  @override
  State<PostApi> createState() => _PostApiState();
}

class _PostApiState extends State<PostApi> {
  String? myData;
  List<PostModel> list = [];

  Future getData() async {
    await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'))
        .then((value) {
      Iterable parseData = jsonDecode(value.body);
      list = List<PostModel>.from(parseData.map(
        (e) => PostModel.fromJson(e),
      ));
    });
    print('**********');
    print(list[1].id);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    print('hello');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(list.length, (index) {
              return Column(
                children: [
                  Text("${list[index].id}"),
                  Text("${list[index].userId}"),
                  Text("${list[index].body}"),
                  Text("${list[index].title}"),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
