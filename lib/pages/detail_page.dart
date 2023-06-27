import 'package:entre/cubit/app_cubits.dart';
import 'package:entre/cubit/cubit_states.dart';
import 'package:entre/model/Listing_model.dart';
import 'package:entre/widgets/basic_button.dart';
import 'package:entre/widgets/general_button.dart';
import 'package:entre/widgets/text_description.dart';
import 'package:entre/widgets/text_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List dates = [
    "01.09.2023",
    "02.09.2023",
    "06.09.2023",
    "08.09.2023",
    "09.09.2023",
  ];
  int chosenIndex = 10;

  bool jobSaved=false;
  bool buttonClicked=false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detailState = state as DetailState;
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
                        image: NetworkImage(
                            "https://ostweg.github.io/${detailState.listing.image}"),
                        fit: BoxFit.cover),
                  ),
                )),
            Positioned(
                left: 20,
                top: 40,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                      icon: Icon(Icons.arrow_back),
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
                            text: detailState.listing.name,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          TextTitle(
                              text: "CHF " +
                                  detailState.listing.pricerperhour.toString() +
                                  "/hour",
                              color: const Color(0xFF4c8bfc))
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.location_on,
                              color: const Color(0xFF4c8bfc)),
                          SizedBox(width: 5),
                          TextDescription(
                            text: "Switzerland, " + detailState.listing.city,
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
                                  color: detailState.listing.stars > index
                                      ? const Color(0xFFffa651)
                                      : const Color(0xFF4c8bfc)
                                          .withOpacity(0.3));
                            }),
                          ),
                          SizedBox(width: 10),
                          TextDescription(
                            text: "(" +
                                detailState.listing.stars.toString() +
                                ")",
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
                      SizedBox(height: 10),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                chosenIndex = index;
                              });
                            },
                            child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: BasicButton(
                                  size: 60,
                                  color: chosenIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: chosenIndex == index
                                      ? Color(0xFF4c8bfc).withOpacity(0.6)
                                      : Colors.grey.withOpacity(0.2),
                                  borderColor: chosenIndex == index
                                      ? Color(0xFF4c8bfc).withOpacity(0.6)
                                      : Colors.grey.withOpacity(0.1),
                                  text: dates[index],
                                )),
                          );
                        }),
                      ),
                      SizedBox(height: 20),
                      TextTitle(
                          text: "Description",
                          color: Colors.black.withOpacity(0.8)),
                      SizedBox(
                        height: 5,
                      ),
                      TextDescription(
                        text: detailState.listing.description,
                        size: 12,
                      ),
                    ],
                  ),
                )),
            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    InkWell(
                      child: BasicButton(
                        size: 60,
                        color: Color(0xFF4c8bfc).withOpacity(0.6),
                        backgroundColor: Colors.white,
                        borderColor: Color(0xFF4c8bfc).withOpacity(0.4),
                        isIcon: true,
                        icon: jobSaved?Icons.bookmark:Icons.bookmark_border,
                      ),
                      onTap: (){
                        setState(() {
                          jobSaved = !jobSaved;
                        });
                      },
                    ),
                    SizedBox(width: 20),

                      GeneralButton(
                        text: "Apply",
                        responsive: true,
                      ),

                  ],
                ))
          ],
        ),
      ));
    });
  }
}
