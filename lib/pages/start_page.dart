import 'package:entre/widgets/general_button.dart';
import 'package:entre/widgets/text_description.dart';
import 'package:entre/widgets/text_title.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  List images = [
    "happywomen1.jpg",
    "happywomen2.jpg"
  ];

  //create text list with texts and reuse the same way as images with index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_,index){
            return Container(
              width: double.maxFinite,
              height:double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "images/"+images[index]
                  ),
                  fit:BoxFit.cover
                )
              ),
              child: Container(
                margin: const EdgeInsets.only(top:150,left:20,right:20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextTitle(text:"Volunteer Connect",size:30),
                        TextDescription(text: "Beta",size:30),
                        const SizedBox(height: 20),
                        Container(
                          width: 250,
                          child:TextDescription(
                              text:"This is a student based solution still in the process of development. Currently this version is only for gui use.",
                              color:const Color(0xFF989acd), //find matching color pattern
                              size:14,
                          )
                        ),
                        const SizedBox(height: 20),
                        GeneralButton(width: 80,)
                      ],
                    ),
                    Column(
                      children: List.generate(2, (indexSlider){
                        return Container(
                          margin: const EdgeInsets.only(bottom:2),
                          width: 8,
                          height: index==indexSlider?25:8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: index==indexSlider?const Color(0xFF4c8bfc):const Color(0xFF4c8bfc).withOpacity(0.6)
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
      }),
    );
  }
}
