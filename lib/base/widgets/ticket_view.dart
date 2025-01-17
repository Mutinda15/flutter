import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket/base/ress/styles/app_styles.dart';
import 'package:ticket/base/widgets/app_column_text_layout.dart';
import 'package:ticket/base/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket/base/widgets/big_circle.dart';
import 'package:ticket/base/widgets/big_dot.dart';
import 'package:ticket/base/widgets/text_style_fourth.dart';
import 'package:ticket/base/widgets/text_style_third.dart';

class TicketView extends StatelessWidget {
  final Map<String,dynamic> ticket;
  final bool wholeScreen;
  final bool? isColor;
  const TicketView({super.key, required this.ticket,this.wholeScreen=false, this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.85,
      height: 182,
      child: Container(
        margin: EdgeInsets.only(right: wholeScreen==true?0:16),
        child: Column(
          children: [
            // Blue part of the ticket
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isColor == null? AppStyles.ticketBlue:AppStyles.ticketColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(21),
                  topRight: Radius.circular(21),
                ),
              ),
              child: Column(
                children: [
                  // Departure and destination with icons (first line)
                  Row(
                    children: [
                      TextStyleThird(text: ticket["from"]["code"],isColor: isColor,),
                      Expanded(child: Container()),
                       BigDot(isColor: isColor,),
                      //ticket flying icon
                      Expanded(
                        child: Stack(
                          children: [
                            const SizedBox(
                              height: 24,
                              child: AppLayoutbuilderWidget(
                                randomDivider: 6,
                              ),
                            ),
                            Center(
                              child: Transform.rotate(
                                angle: 1.57,
                                child:  Icon(
                                  Icons.local_airport_rounded,
                                  color:isColor==null? Colors.white:AppStyles.planeSecondColor,

                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                       BigDot(isColor: isColor,),
                      Expanded(child: Container()),
                       TextStyleThird(text: ticket["to"]["code"],isColor: isColor,),
                    ],
                  ),
                  const SizedBox(height: 3),
                  // Departure and destination names with time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextStyleFourth(text: ticket["from"]["name"],isColor: isColor,),
                      TextStyleFourth(text: ticket["flying_time"],isColor: isColor,),
                      TextStyleFourth(text:  ticket["to"]["name"], align: TextAlign.end,isColor: isColor,),
                    ],
                  ),
                ],
              ),
            ),
            // Circles and dots
            Container(
              height: 20,
              color: isColor==null? AppStyles.ticketOrange:AppStyles.ticketColor,
              child:  Row(
                children: [
                  BigCircle(isRight: false,
                  isColor: isColor,
                  ),
                  Expanded(
                    child: AppLayoutbuilderWidget(
                      randomDivider: 20,
                      width: 6,
                      isColor: isColor,
                    ),
                  ),
                  BigCircle(isRight: true,
                 isColor: isColor,
                  ),
                ],
              ),
            ),
            // Orange part of the ticket
            Container(
              padding:  EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isColor==null? AppStyles.ticketOrange:AppStyles.ticketColor,
                borderRadius:  BorderRadius.only(
                  bottomLeft: Radius.circular(isColor==null?21:0),
                  bottomRight: Radius.circular(isColor==null?21:0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppColumnTextLayout(
                    topText: ticket["date"],
                    bottomText: "Date",
                    alignment: CrossAxisAlignment.start,
                    isColor:isColor,
                  ),
                  AppColumnTextLayout(
                    topText: ticket["departure_time"],
                    bottomText: "Departure",
                    alignment: CrossAxisAlignment.center,
                    isColor: isColor,
                  ),
                  AppColumnTextLayout(
                    topText: ticket["number"].toString(),
                    bottomText: "Number",
                    alignment: CrossAxisAlignment.end,
                    isColor:isColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
