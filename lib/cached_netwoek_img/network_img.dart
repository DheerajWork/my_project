import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyNetworkImg extends StatefulWidget {
  const MyNetworkImg({Key? key}) : super(key: key);

  @override
  State<MyNetworkImg> createState() => _MyNetworkImgState();
}

class _MyNetworkImgState extends State<MyNetworkImg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CachedNetworkImage(
          imageUrl:
              'https://static.vecteezy.com/system/resources/thumbnails/002/172/762/small/house-front-view-illustration-free-vector.jpg',
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
