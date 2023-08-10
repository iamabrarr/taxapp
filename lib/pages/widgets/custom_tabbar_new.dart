import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../model/tab_bar.dart';
import '../../utils/size_config.dart';

class CustomTabBarNew extends StatelessWidget {
  const CustomTabBarNew({
    super.key,
    required this.items,
    required this.selectedIndex,
  });

  final List<TabbarItem> items;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Center(
      child: Container(
        height: SizeConfig.heightMultiplier * 5,
        width: SizeConfig.widthMultiplier * 92,
        margin: EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(26),
        ),
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 1),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              left: selectedIndex == 0
                  ? 0
                  : selectedIndex == 1
                      ? items.length == 2
                          ? SizeConfig.widthMultiplier * 45
                          : SizeConfig.widthMultiplier * 30
                      : SizeConfig.widthMultiplier * 60,
              curve: Curves.bounceOut,
              child: Container(
                alignment: Alignment.topLeft,
                height: SizeConfig.heightMultiplier * 4,
                width: SizeConfig.widthMultiplier * 90 / items.length,
                decoration: BoxDecoration(
                    color: AppColors.primaryClr,
                    borderRadius: BorderRadius.circular(26)),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Row(
                children: [
                  ...List.generate(
                    items.length >= 3 ? 3 : items.length,
                    (index) => InkWell(
                      onTap: items[index].onTap,
                      child: SizedBox(
                        height: SizeConfig.heightMultiplier * 4,
                        width: SizeConfig.widthMultiplier * 90 / items.length,
                        child: Center(
                          child: Text(
                            items[index].text,
                            style: textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: selectedIndex == index
                                    ? AppColors.whiteClr
                                    : AppColors.blackClr),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
