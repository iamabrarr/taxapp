import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class CustomBackBtn extends StatelessWidget {
  const CustomBackBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(FeatherIcons.arrowLeft)),
    );
  }
}
