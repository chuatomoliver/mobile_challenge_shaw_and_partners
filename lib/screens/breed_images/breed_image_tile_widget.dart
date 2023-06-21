import 'package:flutter/material.dart';

class BreedImageTile extends StatelessWidget {
  final String imgUrl;
  const BreedImageTile({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Image.network(
        imgUrl,
        /*width: 200,
        height: 200,*/
        fit: BoxFit.cover,
      ),
    );
  }
}
