import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax/controllers/home.dart';
import '../../../constants/colors.dart';
import '../../../utils/size_config.dart';

class CustomProgressBar extends StatelessWidget {
  final homeCtrl = Get.find<HomeCtrl>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.heightMultiplier * 4,
      width: SizeConfig.widthMultiplier * 90,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(3, (index) {
              final Color selectedColor = AppColors.primaryClr;
              final bool isSelected = index < homeCtrl.currentSection.value;
              return SizedBox(
                height: SizeConfig.heightMultiplier * 4,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      height: 2,
                      width: index == 0
                          ? SizeConfig.widthMultiplier * 32
                          : SizeConfig.widthMultiplier * 27,
                      margin: EdgeInsets.only(
                          right:
                              index == 1 ? SizeConfig.widthMultiplier * 1 : 0,
                          left:
                              index == 0 ? SizeConfig.widthMultiplier * 1 : 0),
                      color: isSelected ? selectedColor : Colors.grey.shade200,
                    ),
                    index == 0
                        ? Positioned(
                            left: 0,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(Icons.circle,
                                    size: SizeConfig.widthMultiplier * 5,
                                    color: AppColors.primaryClr),
                                homeCtrl.currentSection.value > index
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 12,
                                      )
                                    : const SizedBox()
                              ],
                            ))
                        : const SizedBox(),
                    Positioned(
                        right: 0,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.circle,
                              size: SizeConfig.widthMultiplier * 5,
                              color: isSelected
                                  ? selectedColor
                                  : Colors.grey.shade200,
                            ),
                            homeCtrl.currentSection.value - 1 > index
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 12,
                                  )
                                : const SizedBox()
                          ],
                        ))
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
