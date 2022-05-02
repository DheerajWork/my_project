import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_project/api_testing/detail_model.dart';
import 'package:my_project/api_testing/home_screen.dart';

class DataBaseHelper {
  static String? baseUrl = 'http://testapi.sojo.com.my/api/';

  static Future<List<DetailsModel>> getApi() async {
    List<DetailsModel> dataList = [];
    Map body = {"user_id": "5", "firebaseId": "2Ck9tdlIDvRP1heGcS0MjdtXQoJ2"};

    http.Response response = await http.post(
        Uri.parse("${baseUrl}address/get_by_user.php"),
        body: jsonEncode(body));

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);

      dataList =
          (data['data'] as List).map((e) => DetailsModel.fromJson(e)).toList();
      return dataList;
    } else {
      return [];
    }
  }

  static Future<bool> deleteData(id) async {
    Map body = {
      "user_id": "5",
      "id": id,
      "firebaseId": "2Ck9tdlIDvRP1heGcS0MjdtXQoJ2"
    };

    http.Response response = await http.post(
        Uri.parse("${baseUrl}address/delete_address.php"),
        body: jsonEncode(body));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static insertData(data) async {
    http.Response response = await http.post(
        Uri.parse("${baseUrl}address/create_address.php"),
        body: jsonEncode(data));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    }
    print(response);
  }

  // static  updateData() async {
  //   Map data = {
  //     "id":"9",
  //     "user_id" :"5",
  //     "name" :"utsav ji",
  //     "phone_no" :"1234567890",
  //     "alternate_phoneno" :"0000000000",
  //     "zipcode" :"1234156",
  //     "address_line_1" :"astha 99",
  //     "address_line_2" :"ctm",
  //     "city" :"ahmedabad",
  //     "state" :"gujarat",
  //     "firebaseId" :"2Ck9tdlIDvRP1heGcS0MjdtXQoJ2" };
  //
  //   http.Response response = await http.post(Uri.parse("${baseUrl}address/update_address.php"), body: data);
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     return true;
  //   }
  //   print(response);
  // }



}
