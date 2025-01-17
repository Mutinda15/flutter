

import 'package:flutter/material.dart';

class AppTabs extends StatelessWidget {
  const AppTabs({super.key,
    this.tabText = "", this.tabBorder = false,this.tabColor=false});

  final String tabText;
  final bool tabBorder;
  final bool tabColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: tabColor==false?Colors.white:Colors.transparent,
        borderRadius: tabBorder
            ? const BorderRadius.horizontal(
          right: Radius.circular(50),
        )
            : const BorderRadius.horizontal(
          left: Radius.circular(50),
        ),
      ),
      child: Center(
        child: Text(
          tabText,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}