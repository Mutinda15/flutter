import 'package:flutter/material.dart';
import '../../../base/widgets/app_tabs.dart';

class AppTicketTabs extends StatelessWidget {
  final String firstTab ;
  final String secondTab;
  const AppTicketTabs({super.key,required this.firstTab ,required this.secondTab});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color(0xFFF4F6FD),
      ),
      child:  Row(
        children: [
          Expanded(
            child: AppTabs(
              tabText: firstTab,
            ),
          ),
          Expanded(
            child: AppTabs(
              tabText: secondTab,
              tabBorder: true,
              tabColor:true ,
            ),
          ),
        ],
      ),
    );
  }
}
