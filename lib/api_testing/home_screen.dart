import 'package:flutter/material.dart';
import 'package:my_project/api_testing/data_base_helper.dart';
import 'package:my_project/api_testing/detail_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DetailsModel> dataList = [];

  getData() async {
    dataList = await DataBaseHelper.getApi();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    // DataBaseHelper.deleteData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (c, i) {
                var a = dataList[i];
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text("${a.addressId}"),
                          Text("${a.userId}"),
                          Text("${a.name}"),
                          Text("${a.phoneNo}"),
                          Text("${a.alternatePhoneno}"),
                          Text("${a.zipcode}"),
                          Text("${a.addressLine1}"),
                          Text("${a.addressLine2}"),
                          Text("${a.city}"),
                          Text("${a.state}"),
                          Text("${a.createdAt}"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (c)=>  InsertDataPage(a: a,)));
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                    size: 30,
                                  )),
                              IconButton(
                                  onPressed: () async {
                                     var  id = a.addressId;
                                    bool res = await DataBaseHelper.deleteData(
                                        id);
                                    if (res == true) {
                                      dataList.removeAt(i);
                                      setState(() {});
                                    }

                                    // print(dataList.reversed.toString());
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 30,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (c) {
                  return InsertDataPage();
                }));
              },
              child: const Text('Insert Data'))
        ],
      ),
    );
  }
}

class InsertDataPage extends StatefulWidget {

  final DetailsModel? a;

   InsertDataPage({Key? key, this.a,}) : super(key: key);

  @override
  State<InsertDataPage> createState() => _InsertDataPageState();
}

class _InsertDataPageState extends State<InsertDataPage> {
  TextEditingController? name = TextEditingController();
  TextEditingController? phoneNo = TextEditingController();
  TextEditingController? zipCode = TextEditingController();
  TextEditingController? city = TextEditingController();
  TextEditingController? state = TextEditingController();


  Abhi(){
    name!.text = widget.a!.name!;
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Abhi();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomTextField(
              controller: name,
              hint: 'Name',
            ),
            CustomTextField(
              controller: phoneNo,
              hint: 'Phone No',
            ),
            CustomTextField(
              controller: zipCode,
              hint: 'ZipCode',
            ),
            CustomTextField(
              controller: city,
              hint: 'City',
            ),
            CustomTextField(
              controller: state,
              hint: 'State',
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>const HomeScreen()));
                  Map data = {
                    "user_id": "5",
                    "name": name!.text,
                    "phone_no": phoneNo!.text,
                    "alternate_phoneno": "0000000000",
                    "zipcode": zipCode!.text,
                    "address_line_1": "abc",
                    "address_line_2": "lucknow",
                    "city": city!.text,
                    "state": state!.text,
                    "firebaseId": "2Ck9tdlIDvRP1heGcS0MjdtXQoJ2"
                  };
                  DataBaseHelper.insertData(data);

                  setState(() {});
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }
}


class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;

  const CustomTextField({Key? key, this.controller, this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(hintText: hint),
      ),
    );
  }
}
