import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../utils/size_config.dart';

class HomeCtrl extends GetxController {
  Widget getGreeting(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat('a');
    var amPm = formatter.format(now);

    if (amPm == 'AM') {
      return Row(
        children: [
          Text('Good morning', style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(width: SizeConfig.widthMultiplier * 2),
          SvgPicture.asset(
            "assets/icons/sun.svg",
            height: SizeConfig.imageSizeMultiplier * 5,
          )
        ],
      );
    } else {
      return Row(
        children: [
          Text('Good afternoon', style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(width: SizeConfig.widthMultiplier * 2),
          SvgPicture.asset(
            "assets/icons/moon.svg",
            height: SizeConfig.imageSizeMultiplier * 5,
          )
        ],
      );
    }
  }

  RxInt selectedTab = 0.obs;
  PageController pageCont = PageController(initialPage: 0);
  RxInt currentSection = 0.obs;

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController insuranceCtrl = TextEditingController();
  final TextEditingController dobCtrl = TextEditingController();
  final TextEditingController addressCtrl = TextEditingController();
  final TextEditingController utrCtrl = TextEditingController();
  final TextEditingController taxYearCtrl = TextEditingController();

  RxString employmentIncome = "".obs;
  RxString pensionIncome = "".obs;
  RxString benefits = "".obs;

  RxString pensionScheme = "".obs;
  RxString giftDonation = "".obs;
  final TextEditingController pensionCtrl = TextEditingController();
  final TextEditingController donationCtrl = TextEditingController();
}
