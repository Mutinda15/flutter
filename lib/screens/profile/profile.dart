import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket/base/ress/media.dart';
import 'package:ticket/base/ress/styles/app_styles.dart';
import 'package:ticket/base/widgets/app_column_text_layout.dart';
import 'package:ticket/base/widgets/heading_text.dart';
import 'package:ticket/base/widgets/text_style_third.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const Padding(padding: EdgeInsets.only(top: 40)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //shows the logo
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage(AppMedia.logo))),
              ),

              const SizedBox(
                width: 10,
              ),
              //shows the column text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeadingText(text: "Book Tickets", isColor: false),
                  Text("Nairobi",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500)),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                    //decoration
                    decoration: BoxDecoration(
                        color: AppStyles.profileLocationColor,
                        borderRadius: BorderRadius.circular(100)),
                    //child ->row ->icon->text
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppStyles.profileTextColor),
                          child: const Icon(
                            FluentSystemIcons.ic_fluent_shield_filled,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Premium status",
                          style: TextStyle(
                            color: AppStyles.profileTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Expanded(child: Container()),
              Text(
                "Edit",
                style: TextStyle(
                    color: AppStyles.PrimaryColor, fontWeight: FontWeight.w300),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          //divider
          Divider(
            color: Colors.grey.shade400,
          ),
          //show the card
          Stack(
            children: [
              Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppStyles.PrimaryColor,
                    borderRadius: BorderRadius.circular(18)),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(
                        FluentSystemIcons.ic_fluent_lightbulb_filament_filled,
                        color: AppStyles.PrimaryColor,
                        size: 27,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextStyleThird(
                          text: "You\'ve got a new award",
                          isColor: null,
                        ),
                        Text(
                          "You have 95 flights a year  ",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.8)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                  top: -40,
                  right: -45,
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(width: 18, color: const Color(0xFF264CD2))),
                  ))
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Accumulated miles",
            style: AppStyles.headLineStyle2,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppStyles.backgroundColor),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "192802",
                  style: TextStyle(
                      fontSize: 45,
                      color: AppStyles.textColor,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                //row -> text,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Miles accured",
                      style: AppStyles.headLineStyle4.copyWith(fontSize: 15),
                    ),
                    Text(
                      "16 july",
                      style: AppStyles.headLineStyle4.copyWith(fontSize: 15),
                    )
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                //divider
                Divider(
                  color: Colors.grey.shade400,
                ),
                const SizedBox(
                  height: 4,
                ),
                //row ->column
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   AppColumnTextLayout(
                     topText: "23 042",
                     bottomText: "Miles",
                     alignment: CrossAxisAlignment.start,
                     isColor: false,
                   ),

                    AppColumnTextLayout(
                      topText: "McDonald\'s",
                      bottomText: "Received From",
                      alignment: CrossAxisAlignment.end,
                      isColor: false,
                    ),

                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                //divider
                Divider(
                  color: Colors.grey.shade400,
                ),
                const SizedBox(
                  height: 4,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnTextLayout(
                      topText: "Airline CO",
                      bottomText: "Received From",
                      alignment: CrossAxisAlignment.start,
                      isColor: false,
                    ),
                    AppColumnTextLayout(
                      topText: "23 ",
                      bottomText: "Miles",
                      alignment: CrossAxisAlignment.end,
                      isColor: false,
                    ),
                  ],
                ),
                //divider
                Divider(
                  color: Colors.grey.shade400,
                ),
                const SizedBox(
                  height: 4,
                ),
               const Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   AppColumnTextLayout(
                     topText: "52 ",
                     bottomText: "Miles",
                     alignment: CrossAxisAlignment.start,
                     isColor: false,
                   ),
                   AppColumnTextLayout(
                     topText: "Shadrack",
                     bottomText: "Received From",
                     alignment: CrossAxisAlignment.end,
                     isColor: false,
                   ),
                 ],
               ) ,
                const SizedBox(height: 60,),
                InkWell(
                  onTap: () {
                 print("tapped");
                  },
                  child: Text("How to get more miles",
                    style:AppStyles.textStyle.copyWith(
                      color: AppStyles.PrimaryColor,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                )//row -> column
                // row -->column
                //text
              ],
            ),
          )
        ],
      ),
    );
  }
}
