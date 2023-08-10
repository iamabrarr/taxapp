import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../utils/size_config.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.isBorder = false,
      this.isLarge = false})
      : super(key: key);
  final VoidCallback onTap;
  final bool isBorder;
  final String title;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: SizeConfig.heightMultiplier * 6,
      minWidth: isLarge
          ? SizeConfig.widthMultiplier * 90
          : SizeConfig.widthMultiplier * 40,
      elevation: isBorder ? 0 : 12,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: isBorder ? AppColors.textClr : AppColors.primaryClr),
        borderRadius: BorderRadius.circular(35),
      ),
      color: isBorder ? Colors.white : AppColors.primaryClr,
      onPressed: onTap,
      child: Text(
        title,
        style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2,
            color: isBorder ? AppColors.textClr : Colors.white,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
