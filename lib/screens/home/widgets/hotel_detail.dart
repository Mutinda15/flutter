import 'package:flutter/material.dart';
import 'package:ticket/base/ress/styles/app_styles.dart';
import 'package:ticket/base/utils/all_json.dart';
import 'package:get/get.dart';
import '../../../controller/text_expansion_controller.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late int index = 0;

  @override
  void didChangeDependencies() {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    print(args["index"]);
    index = args["index"];
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppStyles.PrimaryColor),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              // title: Text(hotelList[index]["place"]),
              background: Stack(
                children: [
                  Positioned.fill(
                      child: Image.asset(
                    "assets/images/${hotelList[index]['image']}",
                    fit: BoxFit.cover,
                  )),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        color: Colors.black.withOpacity(0.3),
                        child: Text(
                          hotelList[index]["place"],
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                    blurRadius: 10.0,
                                    color: AppStyles.PrimaryColor,
                                    offset: const Offset(2.0, 2.0))
                              ]),
                        )),
                  )
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ExpandedTextWidget(
                text: hotelList[index]["detail"]
              )
              /* Text(
                  "Each of these APIs provides a vast selection of high-quality images that you can use in your Flutter app. You can find images by categories or search for specific ones, and they offer varying levels of access, from free to premium plans.")*/
              ,
            ),
            const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "more images",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 100.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hotelList[index] ["images"].length,
                  itemBuilder: (context, imagesIndex) {
                    print("${hotelList[index]["images"][0]}");
                    return Container(
                        margin: const EdgeInsets.all(8),
                       // color: Colors.orange,
                        child: Image.asset("assets/images/${hotelList[index]["images"][imagesIndex]}"));
                  }),
            )
          ]))
        ],
      ),
    );
  }
}

class ExpandedTextWidget extends StatelessWidget {
  ExpandedTextWidget({super.key, required this.text});
  final String text;

final TextExpansionController controller = Get.put(TextExpansionController());

  @override
  Widget build(BuildContext context) {


    return Obx((){
      var textWidget = Text(
        text,
        maxLines: controller.isExpanded.value?null:6,
        overflow:controller.isExpanded.value?TextOverflow.visible:TextOverflow.ellipsis,
      );
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            textWidget,
            GestureDetector(
              onTap: (){
                controller.toggleExpansion ();
              },
              child: Text(
                controller.isExpanded.value?'Less':'More',
                style:AppStyles.textStyle.copyWith(
                    color: AppStyles.PrimaryColor

                ) ,
              ),
            )
          ]
      );
    });
  }
}