import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax/pages/widgets/custom_btn.dart';
import 'package:tax/utils/size_config.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 4),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.heightMultiplier * 15),
            Image.asset(
              "assets/icons/success.png",
              height: SizeConfig.heightMultiplier * 11,
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 3),
            Text("Data Verified!',", style: textTheme.headlineLarge),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 9,
                  vertical: SizeConfig.heightMultiplier * 1.5),
              child: Text(
                "'Hi Lorem, Your Data has been verified successfully.",
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium!.copyWith(
                    fontSize: SizeConfig.textMultiplier * 1.5,
                    color: Colors.blueGrey.shade300,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            CustomButton(
              title: "Back",
              onTap: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }
}
