import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax/constants/colors.dart';
import 'package:tax/controllers/auth.dart';
import 'package:tax/pages/home/home.dart';
import 'package:tax/pages/widgets/loading.dart';

import '../../utils/size_config.dart';
import '../widgets/custom_btn.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final ctrl = Get.put(AuthCtrl());
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Obx(
      () => ShowLoading(
        inAsyncCall: ctrl.isLoading.value,
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(height: SizeConfig.heightMultiplier * 12),

              //ONBOARIDNG IMAGE
              Image.asset("assets/images/app_logo.png",
                  // color: AppColors.primaryClr,
                  height: SizeConfig.heightMultiplier * 30),
              //TITLE
              SizedBox(height: SizeConfig.heightMultiplier * 10),
              Text('Welcome to Tax App!', style: textTheme.headlineSmall),
              SizedBox(height: SizeConfig.heightMultiplier * 1),
              //SUBTITLE
              Text('Your budget app made easy',
                  style: textTheme.bodySmall!
                      .copyWith(color: Colors.grey.shade400)),
              SizedBox(height: SizeConfig.heightMultiplier * 20),
              //BUTTON
              CustomButton(
                  title: 'TO ENTER',
                  isLarge: true,
                  onTap: () {
                    ctrl.login();
                    // Get.to(() => HomeScreen(),
                    //     transition: Transition.rightToLeft);
                  }),
              //REGISTER ACCOUNT
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account yet?",
                      style: textTheme.bodySmall),
                  TextButton(
                      onPressed: () {
                        ctrl.login();
                      },
                      child: Text(
                        'Create one now',
                        style: textTheme.bodySmall!.copyWith(
                            color: AppColors.primaryClr,
                            fontWeight: FontWeight.w600),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
