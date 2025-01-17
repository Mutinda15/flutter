import 'package:flutter/material.dart';

import '../../../base/ress/styles/app_styles.dart';

class TicketPositionedCircle extends StatelessWidget {
  final bool? pos;
  const TicketPositionedCircle({super.key,this.pos});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left:pos==true?22:null,
        right: pos==true?null:22,
        top: 259,
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              shape: BoxShape.circle,border: Border.all(width: 2)
          ),
          child: CircleAvatar(
            maxRadius: 4,
            backgroundColor: AppStyles.textColor,
          ),
        ));
  }
}
