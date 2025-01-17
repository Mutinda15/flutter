import 'package:get/get.dart';

class BottomNavBarController extends GetxController{
  //RXint
var selectedIndex = 0.obs;

void onItemTapped(int index){
  print("my index is $index");
 selectedIndex.value = index;
}
}
