import 'package:flutter/material.dart';
import '../../../utils/size_config.dart';

class Expences extends StatelessWidget {
  const Expences({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 4),
      child: Column(
        children: [
          SizedBox(height: SizeConfig.heightMultiplier * 1),
          Center(
            child: Text(
              "Expenses",
              style: textTheme.bodyLarge!.copyWith(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
        ],
      ),
    );
  }
}
