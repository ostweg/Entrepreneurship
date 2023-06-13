import 'package:entre/widgets/text_description.dart';
import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  double size;
  String? text;
  IconData? icon;
  final Color borderColor;
  bool? isIcon;

  BasicButton({super.key,this.isIcon=false,this.text="HIi",this.icon,required this.size,required this.color, required this.backgroundColor, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: isIcon==false?Center(child: TextDescription(text: text!,color: color)):Center(child: Icon(icon,color:color)),
    );
  }
}
