import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:ticket/base/ress/media.dart';
import 'package:ticket/base/ress/styles/app_styles.dart';
import 'package:ticket/base/utils/all_json.dart';
import 'package:ticket/base/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket/base/widgets/ticket_view.dart';
import 'package:ticket/screens/search/widgets/app_ticket_tabs.dart';
import 'package:ticket/screens/ticket/widgets/ticket_positioned_circle.dart';

import '../../base/widgets/app_column_text_Layout.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
late  int ticketIndex = 0;
  @override
  void didChangeDependencies(){
    if(ModalRoute.of(context)!.settings.arguments !=null){
      print("the value is null");
      var args = ModalRoute.of(context)!.settings.arguments as Map;
      print("passed index ${args["index"]}");
      ticketIndex = args["index"];
    }

    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: AppBar(

        title: const Text("Tickets"),
        backgroundColor: AppStyles.backgroundColor,
      ),

      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            children: [
              //const SizedBox(height: 40),
              //Text("Tickets", style: AppStyles.headLineStyle1),
             // const SizedBox(height: 20),
              const AppTicketTabs(
                firstTab: "upcoming",
                secondTab: "previous",
              ),
              const SizedBox(height: 20),
              //white tickets and black tickets
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: TicketView(ticket: ticketList[ticketIndex], isColor: true),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                color: AppStyles.ticketColor,
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: "Flutter DB",
                          bottomText: "passenger",
                          alignment: CrossAxisAlignment.start,
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          topText: "5221 36869",
                          bottomText: "passport",
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const AppLayoutbuilderWidget(
                      randomDivider: 15,
                      width: 5,
                      isColor: false,
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: "34567 67897658",
                          bottomText: "Number of E-Ticket",
                          alignment: CrossAxisAlignment.start,
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          topText: "B46859",
                          bottomText: "Booking Code",
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const AppLayoutbuilderWidget(
                      randomDivider: 15,
                      width: 5,
                      isColor: false,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppMedia.visaCard,
                                  scale: 11,
                                ),
                                Text(
                                  "****654",
                                  style: AppStyles.headLineStyle3,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Payment Method",
                              style: AppStyles.headLineStyle4,
                            )
                          ],
                        ),
                        const AppColumnTextLayout(
                          topText: "\$399.99",
                          bottomText: "price",
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height:1 ,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: AppStyles.ticketColor,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(21),
                        bottomLeft: Radius.circular(21))),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BarcodeWidget(
                        height: 70,
                        data: ' https://mutinda15.github.io/shadrack-/',
                        drawText: false,
                        color: AppStyles.textColor,
                        width: double.infinity,
                        barcode: Barcode.code128()),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              //colorful ticket
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: TicketView(ticket: ticketList[ticketIndex],),
              ),
              const SizedBox(height: 20,)
            ],
          ),
          const TicketPositionedCircle(pos: true,),
          const TicketPositionedCircle(pos: null,),
        ],
      ),
    );
  }
}
