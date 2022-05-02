import 'package:flutter/material.dart';
import 'package:my_project/src/custom_textfield.dart';
import 'package:my_project/src/data.dart';
import 'package:my_project/src/detail.dart';
import 'package:my_project/src/detail_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: Data.detailList.length,
              itemBuilder: (c, index) =>
                  buildDetails(Data.detailList[index], index),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      await showDialog(
                          context: context,
                          builder: (BuildContext context) => MyDialog());
                      setState(() {});
                    },
                    child: const Text('Add Data')),
                ElevatedButton(
                    onPressed: () async {
                      Data.detailList.clear();
                      setState(() {});
                    },
                    child: const Text('Delete All')),
              ],
            )
          ],
        ),
      ),
    );
  }

  buildDetails(item, index) => DetailCard(
        delete: () {
          Data.detailList.removeAt(index);
          setState(() {});
        },
        edit: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => MyDialog(
                    isSelect: false,
                    index: index,
                  ));
          setState(() {});
        },
        detail: item,
      );
}

class MyDialog extends StatefulWidget {
  MyDialog({Key? key, this.index, this.isSelect}) : super(key: key);

  int? index;
  bool? isSelect;

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: AlertDialog(
        title: const Text('Enter Detail'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              keyboardType: TextInputType.name,
              hint: 'Enter Name',
              controller: name,
              validator: (value) {
                // ignore: unrelated_type_equality_checks
                if (value!.isEmpty) {
                  return "Enter Name";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              keyboardType: TextInputType.number,
              hint: 'Enter Age',
              controller: age,
              validator: (value) {
                // ignore: unrelated_type_equality_checks
                if (value!.isEmpty) {
                  return "Enter Age";
                }
                return null;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel')),
          TextButton(
              onPressed: () {
                Data.detailList[widget.index!] = Detail(
                  name: name.text.toString(),
                  age: age.text.toString(),
                );
                Data.detailList.add(Detail(
                  name: name.text.toString(),
                  age: age.text.toString(),
                ));

                Navigator.pop(context);
              },
              child: const Text('Ok')),
        ],
      ),
    );
  }
}
