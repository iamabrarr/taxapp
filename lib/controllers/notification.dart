import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationCtrl extends GetxController {
  RxInt selectedTab = 0.obs;
  PageController pageCont = PageController(initialPage: 0);
}
