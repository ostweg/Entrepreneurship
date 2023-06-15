import 'package:flutter/material.dart';

import 'text_description.dart';

class TextIconWidget extends StatelessWidget {
  String text;
  IconData icon;
  Color color;

  TextIconWidget({super.key,required this.text, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color),
        TextDescription(
          text: text,
          color: Colors.black.withOpacity(0.8),
          size: 11,
        )
      ],
    );
  }
}
