import 'package:entre/widgets/text_description.dart';
import 'package:entre/widgets/text_title.dart';
import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  bool responsive;
  double? width;
  String text;
  GeneralButton({Key? key,this.width=120, this.responsive=false,required this.text}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: responsive==true?double.maxFinite:width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF4c8bfc), //change
        ),
        child:Row(
          mainAxisAlignment: responsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
          children: [
            responsive==true?Container(margin:const EdgeInsets.only(left: 20),child: TextTitle(text:this.text,color:Colors.white,size: 15,)):Container(),
            Image.asset("images/button1.png")
          ],
        )
      ),
    );
  }
}
