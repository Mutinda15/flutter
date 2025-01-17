import 'package:flutter/cupertino.dart';
import 'package:ticket/base/widgets/text_style_fourth.dart';
import 'package:ticket/base/widgets/text_style_third.dart';

class AppColumnTextLayout extends StatelessWidget {
  final String topText;
  final String bottomText;
  final CrossAxisAlignment alignment;
  final bool? isColor;
  const AppColumnTextLayout(
      {super.key,
      this.isColor,
      required this.topText,
      required this.bottomText,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        TextStyleThird(text: topText,isColor: isColor,),
        const SizedBox(
          height: 5,
        ),
        TextStyleFourth(text: bottomText,isColor: isColor,),
      ],
    );
  }
}
