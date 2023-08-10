import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../controllers/home.dart';
import '../../../utils/size_config.dart';

class Review extends StatelessWidget {
  Review({
    super.key,
  });
  final homeCtrl = Get.find<HomeCtrl>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: SizeConfig.heightMultiplier * 60,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.heightMultiplier * 1),
              Center(
                child: Text(
                  "Review",
                  style: textTheme.bodyLarge!.copyWith(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text("What is your full name?",
                  style: textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500)),
              Text(homeCtrl.nameCtrl.text),
              const Divider(),
              Text("What is your National Insurance number?",
                  style: textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500)),
              Text(homeCtrl.insuranceCtrl.text),
              const Divider(),
              Text("What is your date of birth?",
                  style: textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500)),
              Text(homeCtrl.dobCtrl.text),
              const Divider(),
              Text("What is your residential address?",
                  style: textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500)),
              Text(homeCtrl.addressCtrl.text),
              const Divider(),
              Text(
                "Do you have any income from employment?",
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  homeCtrl.employmentIncome.value == "verified"
                      ? "Verified"
                      : "Reject",
                  style: textTheme.bodyMedium!.copyWith(
                      color: homeCtrl.employmentIncome.value == "verified"
                          ? AppColors.primaryClr
                          : Colors.red,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(),
              Text(
                "Do you receive any pension income?",
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  homeCtrl.pensionIncome.value == "verified"
                      ? "Verified"
                      : "Reject",
                  style: textTheme.bodyMedium!.copyWith(
                      color: homeCtrl.pensionIncome.value == "verified"
                          ? AppColors.primaryClr
                          : Colors.red,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(),
              Text(
                "Did you receive any benefits from jobs or pensions?",
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  homeCtrl.benefits.value == "verified" ? "Verified" : "Reject",
                  style: textTheme.bodyMedium!.copyWith(
                      color: homeCtrl.benefits.value == "verified"
                          ? AppColors.primaryClr
                          : Colors.red,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(),
              Text(
                "Have you made any contributions to a pension scheme this year?",
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
              ),
              Text(homeCtrl.pensionCtrl.text),
              const Divider(),
              Text(
                "Have you made any Gift Aid donations this year?",
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
              ),
              Text(homeCtrl.donationCtrl.text),
            ],
          ),
        ),
      ),
    );
  }
}
