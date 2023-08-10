import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/home.dart';
import '../../../utils/size_config.dart';
import '../../widgets/custom_textfield.dart';

class PersonalInformation extends StatelessWidget {
  PersonalInformation({
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
                  "Personal Information",
                  style: textTheme.bodyLarge!.copyWith(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text("What is your full name?", style: textTheme.bodyMedium),
              CustomTextField(
                  hintText: "Full Name",
                  controller: homeCtrl.nameCtrl,
                  keyboardType: TextInputType.name),
              Text("What is your National Insurance number?",
                  style: textTheme.bodyMedium),
              CustomTextField(
                  hintText: "Number",
                  controller: homeCtrl.insuranceCtrl,
                  keyboardType: TextInputType.number),
              Text("What is your date of birth?", style: textTheme.bodyMedium),
              CustomTextField(
                  hintText: "Date of Birth", controller: homeCtrl.dobCtrl),
              Text("What is your residential address?",
                  style: textTheme.bodyMedium),
              CustomTextField(
                  hintText: "Address", controller: homeCtrl.addressCtrl),
              Text("What is your utr?", style: textTheme.bodyMedium),
              CustomTextField(
                  hintText: "3425341678",
                  controller: homeCtrl.utrCtrl,
                  maxLenght: 10,
                  keyboardType: TextInputType.number),
              Text("What is your taxYear?", style: textTheme.bodyMedium),
              CustomTextField(
                  hintText: "2016-17",
                  controller: homeCtrl.taxYearCtrl,
                  keyboardType: TextInputType.number),
            ],
          ),
        ),
      ),
    );
  }
}
