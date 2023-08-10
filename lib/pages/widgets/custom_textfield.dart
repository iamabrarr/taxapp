import 'package:flutter/material.dart';
import 'package:tax/pages/widgets/text_formatter.dart';
import '../../Constants/colors.dart';
import '../../constants/decorations.dart';
import '../../utils/size_config.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.isSpacing = true,
    this.maxLenght,
  });
  final String hintText;
  final TextEditingController controller;
  final bool isSpacing;
  final TextInputType? keyboardType;
  final int? maxLenght;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: SizeConfig.widthMultiplier * 92,
      decoration: AppDecorations.whiteBox,
      margin: EdgeInsets.only(
          top: SizeConfig.heightMultiplier * .2,
          bottom: !isSpacing ? 0 : SizeConfig.heightMultiplier * 2),
      child: TextField(
        controller: controller,
        maxLength: maxLenght,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            isCollapsed: true,
            fillColor: Colors.white,
            filled: true,
            counterText: "",
            contentPadding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 5,
                vertical: SizeConfig.heightMultiplier * 1.5),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryClr))),
      ),
    );
  }
}
