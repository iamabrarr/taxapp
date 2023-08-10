import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/home.dart';
import '../../../utils/size_config.dart';
import '../../widgets/custom_textfield.dart';

class Deductions extends StatelessWidget {
  Deductions({
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
                "Deductions",
                style: textTheme.bodyLarge!.copyWith(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Text(
              "Have you made any contributions to a pension scheme this year?",
              style: textTheme.bodyMedium,
            ),
            homeCtrl.pensionScheme.value == "yes"
                ? Column(
                    children: [
                      SizedBox(height: SizeConfig.heightMultiplier * 1),
                      CustomTextField(
                          hintText: "Enter Amount",
                          controller: homeCtrl.pensionCtrl),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          homeCtrl.pensionScheme.value = "yes";
                        },
                        child: Text(
                          "YES",
                          style: textTheme.bodyMedium!
                              .copyWith(color: Colors.blue),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "NO",
                          style:
                              textTheme.bodyMedium!.copyWith(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
            const Divider(),
            Text(
              "Have you made any Gift Aid donations this year?",
              style: textTheme.bodyMedium,
            ),
            homeCtrl.giftDonation.value == "yes"
                ? Column(
                    children: [
                      SizedBox(height: SizeConfig.heightMultiplier * 1),
                      CustomTextField(
                          hintText: "Enter Amount",
                          controller: homeCtrl.donationCtrl),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          homeCtrl.giftDonation.value = "yes";
                        },
                        child: Text(
                          "YES",
                          style: textTheme.bodyMedium!
                              .copyWith(color: Colors.blue),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "NO",
                          style:
                              textTheme.bodyMedium!.copyWith(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
