import 'package:flutter/material.dart';
import 'package:my_project/src/detail.dart';


class DetailCard  extends StatelessWidget {

  final Detail? detail;
  final VoidCallback? delete;
  final VoidCallback? edit;

  const DetailCard({Key? key, this.detail, this.delete, this.edit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0,0),
                spreadRadius: 3,
                blurRadius: 6
              )
            ]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name = ${detail!.name!}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Age = ${detail!.age!}",style: const TextStyle()),
                  ],
                ),
                const Spacer(),
                IconButton(onPressed: edit, icon: const Icon(Icons.edit,color: Colors.green,)),
                IconButton(onPressed: delete, icon: const Icon(Icons.cancel,color: Colors.red,)),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
