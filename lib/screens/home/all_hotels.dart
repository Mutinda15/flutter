import 'package:flutter/material.dart';
import 'package:ticket/app_routes.dart';
import 'package:ticket/base/ress/styles/app_styles.dart';
import 'package:ticket/base/utils/all_json.dart';

class AllHotels extends StatelessWidget {
  const AllHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: AppBar(
        title: const Center(child: Text("All Hotels")),
        backgroundColor: AppStyles.backgroundColor,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 8),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 0.65),
              itemCount: hotelList.length,
              itemBuilder: (context, index) {
                var singleHotel = hotelList[index];
                return HotelGridView(hotel: singleHotel,index:index);
              }),
        ),
      ),
    );
  }
}

class HotelGridView extends StatelessWidget {
  final Map<String, dynamic> hotel;
  final int index;
  const HotelGridView({super.key, required this.hotel,required this.index});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        print("my index is $index");
        Navigator.pushNamed(context, AppRoutes.hotelDetail,arguments: {
          "index":index
        });
      },
      child: Container(
        height: 350,
        margin: const EdgeInsets.only(right: 6),
        decoration: BoxDecoration(
          color: AppStyles.PrimaryColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: Container(
                decoration: BoxDecoration(
                  color: AppStyles.PrimaryColor,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/${hotel['image']}"),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                hotel['destination'],
                style: AppStyles.headLineStyle3
                    .copyWith(color: AppStyles.kakiColor),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      hotel['place'],
                      style: AppStyles.headLineStyle3
                          .copyWith(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "\$${hotel['price']}/night",
                    style: AppStyles.headLineStyle4
                        .copyWith(color: AppStyles.kakiColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
