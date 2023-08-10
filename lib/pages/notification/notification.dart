import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax/controllers/notification.dart';
import 'package:tax/pages/notification/components/all_tab.dart';
import 'package:tax/pages/widgets/custom_appbar.dart';
import 'package:tax/utils/size_config.dart';
import '../../model/tab_bar.dart';
import '../widgets/custom_tabbar_new.dart';
import 'components/unread_tab.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final notificationCtrl = Get.put(NotificationCtrl());
  List tabScreens = [const UnreadTab(), const AllTab()];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: const CustomAppbar(title: "Notifications"),
        body: Column(
          children: [
            CustomTabBarNew(items: [
              TabbarItem(onTap: () => _onCategoryTap(0), text: 'Unread'),
              TabbarItem(onTap: () => _onCategoryTap(2), text: 'All'),
            ], selectedIndex: notificationCtrl.selectedTab.value),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Expanded(
              child: PageView.builder(
                controller: notificationCtrl.pageCont,
                itemCount: 2,
                onPageChanged: (val) {
                  notificationCtrl.selectedTab.value = val;
                  _onCategoryTap(notificationCtrl.selectedTab.value);
                },
                itemBuilder: (_, i) => tabScreens[i],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onCategoryTap(int index) {
    notificationCtrl.selectedTab.value = index;
    notificationCtrl.pageCont.jumpToPage(index);
  }
}
