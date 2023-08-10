import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:tax/utils/size_config.dart';
import 'notification_tile.dart';

class AllTab extends StatelessWidget {
  const AllTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
                child: Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      extentRatio: .3,
                      children: [
                        SlidableAction(
                          onPressed: doNothing,
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(12)),
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete_outline_rounded,
                          label: 'delete',
                        ),
                      ],
                    ),
                    child: const NotificationTile()),
              );
            },
          ),
        )
      ],
    );
  }

  void doNothing(BuildContext context) {
    Get.back();
  }
}
