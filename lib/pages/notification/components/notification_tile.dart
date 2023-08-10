import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../../../constants/colors.dart';
import '../../../utils/size_config.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Center(
      child: Stack(
        children: [
          Container(
            width: SizeConfig.widthMultiplier * 92,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 2,
                  vertical: SizeConfig.heightMultiplier * 3),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryClr.withOpacity(.3)),
                    child: Center(
                      child: Icon(
                        FeatherIcons.mail,
                        color: AppColors.primaryClr,
                      ),
                    ),
                  ),
                  SizedBox(width: SizeConfig.widthMultiplier * 2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Heads Up!",
                        style: textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 74.5,
                        child: Text("Your self assesment is due soon.",
                            style: textTheme.bodyMedium),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              right: SizeConfig.widthMultiplier * 2,
              bottom: SizeConfig.heightMultiplier * .5,
              child: Text("8 minutes ago",
                  style: textTheme.labelSmall!
                      .copyWith(color: AppColors.textLightClr)))
        ],
      ),
    );
  }
}
