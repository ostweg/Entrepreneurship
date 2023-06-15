import 'package:flutter/material.dart';

class TextDescription extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  bool overflow;
  TextDescription({Key? key,this.overflow =false, this.size=10,required this.text,this.color=Colors.black54}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow?TextOverflow.ellipsis:null,
      style: TextStyle(
          color:color,
          fontSize: size,
      ),
    );
  }
}
