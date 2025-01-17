import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket/base/widgets/app_double_text.dart';
import 'package:ticket/base/widgets/ticket_view.dart';
import 'package:ticket/screens/home/widgets/hotel.dart';

import '../../app_routes.dart';
import '../../base/ress/media.dart';
import '../../base/ress/styles/app_styles.dart';
import '../../base/utils/all_json.dart';
import '../../base/widgets/heading_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        children: [
          const SizedBox(height: 25),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First Row with Greeting and Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning",
                          style: AppStyles.headLineStyle3,
                        ),
                        const SizedBox(height: 6),

                          const HeadingText(
                              text: "Book Tickets", isColor: false),

                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            //App media logo
                            image: AssetImage(AppMedia.logo),
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                // Second Row with Search and Empty Space
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFF4F6FD),
                  ),
                  child: const Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        FluentSystemIcons.ic_fluent_search_regular,
                        color: Color(0XFFBFC205),
                      ),
                      Text("Search"),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                AppDoubleText(
                  bigText: 'Upcoming Flights',
                  smallText: 'View all',
                  func: () {
                    Navigator.pushNamed(context, "/all_tickets");
                  },
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: ticketList
                          .map((singleTicket) => GestureDetector(
                                onTap: () {
                                  var index = ticketList.indexOf(singleTicket);

                                  print(
                                      "i am tapped on the ticket number $index");
                                  Navigator.pushNamed(
                                      context, AppRoutes.ticketScreen,
                                      arguments: {"index": index});
                                },
                                child: TicketView(
                                  ticket: singleTicket,
                                ),
                              ))
                          .toList(),
                    )),
                const SizedBox(height: 40),
                AppDoubleText(
                  bigText: 'Hotels',
                  smallText: 'View all',
                  func: () {
                    Navigator.pushNamed(context, "/all_hotels");
                  },
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: hotelList
                          .map((singleHotel) => GestureDetector(
                              onTap: () {
                                var index = hotelList.indexOf(singleHotel);
                                print("my index is $index");
                                Navigator.pushNamed(
                                    context, AppRoutes.hotelDetail,
                                    arguments: {"index": index});
                              },
                              child: Hotel(hotel: singleHotel)))
                          .toList(),
                    ))
              ],
            ),
          ),
          // const SizedBox(height: 40),
          //const AppDoubleText(bigText: 'upcoming Meetings', smallText: 'view all',),
        ],
      ),
    );
  }
}
