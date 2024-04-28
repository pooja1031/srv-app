import 'package:flutter/material.dart';

class ImageTextRow extends StatelessWidget {
  final List<String> imagePaths;
  final List<String> texts;

  const ImageTextRow({
    Key? key,
    required this.imagePaths,
    required this.texts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(imagePaths.length, (index) {
            return Image.asset(
              imagePaths[index],
              width: 70,
              height: 30,
            );
          }),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(texts.length, (index) {
            return Text(
              texts[index],
              style: TextStyle(fontSize: 11,fontWeight: FontWeight.w600),
            );
          }),
        ),
      ],
    );
  }
}