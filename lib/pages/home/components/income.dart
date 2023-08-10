import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../controllers/home.dart';
import '../../../utils/size_config.dart';

class Income extends StatelessWidget {
  Income({
    super.key,
  });

  final homeCtrl = Get.find<HomeCtrl>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Obx(
      () => Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.heightMultiplier * 1),
            Center(
              child: Text(
                "Income",
                style: textTheme.bodyLarge!.copyWith(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Text(
              "Do you have any income from employment?",
              style: textTheme.bodyMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                homeCtrl.employmentIncome.value == ""
                    ? TextButton(
                        onPressed: () {
                          homeCtrl.employmentIncome.value = "verified";
                        },
                        child: Text(
                          "YES",
                          style: textTheme.bodyMedium!
                              .copyWith(color: Colors.blue),
                        ),
                      )
                    : const SizedBox(),
                homeCtrl.employmentIncome.value == ""
                    ? TextButton(
                        onPressed: () {
                          homeCtrl.employmentIncome.value = "reject";
                        },
                        child: Text(
                          "NO",
                          style:
                              textTheme.bodyMedium!.copyWith(color: Colors.red),
                        ),
                      )
                    : const SizedBox(),
                homeCtrl.employmentIncome.value == "verified"
                    ? Text(
                        "Verified",
                        style: textTheme.bodyMedium!.copyWith(
                            color: AppColors.primaryClr,
                            fontWeight: FontWeight.w500),
                      )
                    : const SizedBox(),
                homeCtrl.employmentIncome.value == "reject"
                    ? Text(
                        "Reject",
                        style: textTheme.bodyMedium!.copyWith(
                            color: Colors.red, fontWeight: FontWeight.w500),
                      )
                    : const SizedBox(),
              ],
            ),
            const Divider(),
            Text(
              "Do you receive any pension income?",
              style: textTheme.bodyMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                homeCtrl.pensionIncome.value == ""
                    ? TextButton(
                        onPressed: () {
                          homeCtrl.pensionIncome.value = "verified";
                        },
                        child: Text(
                          "YES",
                          style: textTheme.bodyMedium!
                              .copyWith(color: Colors.blue),
                        ),
                      )
                    : const SizedBox(),
                homeCtrl.pensionIncome.value == ""
                    ? TextButton(
                        onPressed: () {
                          homeCtrl.pensionIncome.value = "reject";
                        },
                        child: Text(
                          "NO",
                          style:
                              textTheme.bodyMedium!.copyWith(color: Colors.red),
                        ),
                      )
                    : const SizedBox(),
                homeCtrl.pensionIncome.value == "verified"
                    ? Text(
                        "Verified",
                        style: textTheme.bodyMedium!.copyWith(
                            color: AppColors.primaryClr,
                            fontWeight: FontWeight.w500),
                      )
                    : const SizedBox(),
                homeCtrl.pensionIncome.value == "reject"
                    ? Text(
                        "Reject",
                        style: textTheme.bodyMedium!.copyWith(
                            color: Colors.red, fontWeight: FontWeight.w500),
                      )
                    : const SizedBox(),
              ],
            ),
            const Divider(),
            Text(
              "Did you receive any benefits from jobs or pensions?",
              style: textTheme.bodyMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                homeCtrl.benefits.value == ""
                    ? TextButton(
                        onPressed: () {
                          homeCtrl.benefits.value = "verified";
                        },
                        child: Text(
                          "YES",
                          style: textTheme.bodyMedium!
                              .copyWith(color: Colors.blue),
                        ),
                      )
                    : const SizedBox(),
                homeCtrl.benefits.value == ""
                    ? TextButton(
                        onPressed: () {
                          homeCtrl.benefits.value = "reject";
                        },
                        child: Text(
                          "NO",
                          style:
                              textTheme.bodyMedium!.copyWith(color: Colors.red),
                        ),
                      )
                    : const SizedBox(),
                homeCtrl.benefits.value == "verified"
                    ? Text(
                        "Verified",
                        style: textTheme.bodyMedium!.copyWith(
                            color: AppColors.primaryClr,
                            fontWeight: FontWeight.w500),
                      )
                    : const SizedBox(),
                homeCtrl.benefits.value == "reject"
                    ? Text(
                        "Reject",
                        style: textTheme.bodyMedium!.copyWith(
                            color: Colors.red, fontWeight: FontWeight.w500),
                      )
                    : const SizedBox(),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
