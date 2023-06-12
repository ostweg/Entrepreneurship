import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  bool responsive;
  double? width;
  GeneralButton({Key? key,this.width, this.responsive=false}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF4c8bfc), //change
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/button1.png")
        ],
      )
    );
  }
}
