import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  TextTitle({Key? key,this.size=20,required this.text,this.color=Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color:color,
        fontSize: size,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
