import 'package:entre/widgets/dropdown_button.dart';
import 'package:entre/widgets/general_button.dart';
import 'package:entre/widgets/text_description.dart';
import 'package:entre/widgets/text_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF4c8bfc),
        body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  top: 100,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 700,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      children: [
                        TextTitle(
                          text: "Leave a Feedback",
                          color: Colors.black.withOpacity(0.8),
                        ),
                        SizedBox(height:40),
                        TextDescription(text: "Select from completed works"),
                        EasyDropdownButton(),
                        SizedBox(height:40),
                        TextDescription(text: "Leave a message (200)"),
                        SizedBox(height:20),
                        TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter a message',
                              isDense: true,
                              contentPadding: EdgeInsets.all(30)
                            ),
                          ),
                        SizedBox(height:40),
                        TextDescription(text: "Leave a rating in stars"),
                        SizedBox(height:20),
                        RatingBar.builder(
                            initialRating: 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: const Color(0xFFffa651),
                            ),
                            onRatingUpdate: (rating){
                              print(rating);
                            },
                        ),
                        SizedBox(height: 200),
                        GeneralButton(text: "Submit",responsive: true,)
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
