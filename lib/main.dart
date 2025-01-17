import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ticket/app_routes.dart';
import 'package:ticket/screens/home/all_hotels.dart';
import 'package:ticket/screens/home/all_tickets.dart';
import 'package:ticket/screens/home/widgets/hotel_detail.dart';
import 'package:ticket/screens/ticket/ticket_screen.dart';
import 'package:get/get.dart';


import 'base/bottom_nav_bar.dart';

void main (){
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        AppRoutes.homePage: (context) => BottomNavBar(),
        AppRoutes.allTickets: (context) => const AllTickets(),
        AppRoutes.ticketScreen: (context) => const TicketScreen(),
        AppRoutes.allHotels: (context) => const AllHotels(),
        AppRoutes.hotelDetail: (context) => const HotelDetail(),

  },
    );
  }
}
