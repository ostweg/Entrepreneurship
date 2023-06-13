import 'package:entre/widgets/basic_button.dart';
import 'package:entre/widgets/general_button.dart';
import 'package:entre/widgets/text_description.dart';
import 'package:entre/widgets/text_title.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int totalStars = 4;
  List dates = [
    "01.09.2023",
    "02.09.2023",
    "06.09.2023",
    "08.09.2023",
    "09.09.2023",
  ];
  int chosenIndex=10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 360,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/0-1.jpg"), fit: BoxFit.cover),
                ),
              )),
          Positioned(
              left: 20,
              top: 40,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                  ),
                ],
              )),
          Positioned(
              top: 310,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 900,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextTitle(
                          text: "Sams Depot",
                          color: Colors.black.withOpacity(0.8),
                        ),
                        TextTitle(
                            text: "20chf/hour", color: const Color(0xFF4c8bfc))
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: const Color(0xFF4c8bfc)),
                        SizedBox(width: 5),
                        TextDescription(
                          text: "Luzern, Vögeligarte",
                          color: const Color(0xFF4c8bfc).withOpacity(0.6),
                          size: 13,
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star,
                                color: totalStars > index
                                    ? const Color(0xFFffa651)
                                    : const Color(0xFF4c8bfc).withOpacity(0.3));
                          }),
                        ),
                        SizedBox(width: 10),
                        TextDescription(
                          text: "(4.2)",
                          color: const Color(0xFF4c8bfc).withOpacity(0.6),
                          size: 13,
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    TextTitle(
                      text: "Availability",
                      color: Colors.black.withOpacity(0.8),
                      size: 17,
                    ),
                    SizedBox(height: 5),
                    TextDescription(
                        text: "Please select an available date!",
                        color: Color(0xFF4c8bfc).withOpacity(0.6),
                        size: 12),
                    SizedBox(height:10),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: (){
                            setState(() {
                              chosenIndex = index;
                            });
                          },
                          child: Container(
                            margin:const EdgeInsets.only(right: 10),
                              child: BasicButton(
                            size: 60,
                            color: chosenIndex==index?Colors.white:Colors.black,
                            backgroundColor: chosenIndex==index?Color(0xFF4c8bfc).withOpacity(0.6):Colors.grey.withOpacity(0.2),
                            borderColor: chosenIndex==index?Color(0xFF4c8bfc).withOpacity(0.6):Colors.grey.withOpacity(0.1),
                            text: dates[index],
                          )),
                        );
                      }),
                    ),
                    SizedBox(height:20),
                    TextTitle(text: "Description", color:Colors.black.withOpacity(0.8)),
                    SizedBox(height: 5,),
                    TextDescription(text: "We from Sams Depot are looking for any person who is willing to "
                        "help pick up animal-fur at our upcoming animal-fur-picking-convetion! "
                        "Also other type of work like helping out staff team at the office can be on your daily tasks"
                        "so be prepared to have a day filled with a diverse environment! Working hours are from 08:00-22:00.",size: 12,)
                  ],
                ),
              )),
          Positioned(
            bottom: 20,
              left:20,
              right:20,
              child: Row(
                children: [
                  BasicButton(size: 60, color: Color(0xFF4c8bfc).withOpacity(0.6), backgroundColor: Colors.white, borderColor: Color(0xFF4c8bfc).withOpacity(0.4),isIcon: true,icon: Icons.bookmark_border),
                  SizedBox(width: 20),
                  GeneralButton(
                    responsive: true,
                  )
                ],
              ))
        ],
      ),
    ));
  }
}
