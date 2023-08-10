import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:plaid_transactions/plaid_accounts/view/plaid_accounts.dart';
import 'package:tax/constants/colors.dart';
import 'package:tax/controllers/home.dart';
import 'package:tax/pages/home/components/progress_bar.dart';
import 'package:tax/pages/notification/notification.dart';
import 'package:tax/pages/success/success.dart';
import 'package:tax/pages/widgets/custom_btn.dart';
import 'package:tax/pages/widgets/custom_textfield.dart';
import 'package:tax/utils/size_config.dart';
import '../../model/tab_bar.dart';
import '../widgets/custom_tabbar_new.dart';
import 'components/deduction.dart';
import 'components/expences.dart';
import 'components/income.dart';
import 'components/personal_information.dart';
import 'components/review.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homeCtrl = Get.put(HomeCtrl());

  List tabScreens = [
    const PlaidAccounts(),
    const Center(child: Text("Account")),
    TaxTab(),
  ];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.heightMultiplier * 4),
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hello Lorem",
                          style: textTheme.headlineLarge!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        homeCtrl.getGreeting(context)
                      ],
                    ),
                    IconButton(
                      onPressed: () => Get.to(() => NotificationScreen(),
                          transition: Transition.rightToLeft),
                      icon: Icon(FeatherIcons.bell,
                          color: Colors.black,
                          size: SizeConfig.imageSizeMultiplier * 6),
                    )
                  ],
                ),
              ),
              CustomTabBarNew(items: [
                TabbarItem(onTap: () => _onCategoryTap(0), text: 'Purchases'),
                TabbarItem(onTap: () => _onCategoryTap(1), text: 'Accounts'),
                TabbarItem(onTap: () => _onCategoryTap(2), text: 'Tax'),
              ], selectedIndex: homeCtrl.selectedTab.value),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              SizedBox(
                height: SizeConfig.heightMultiplier * 78,
                child: PageView.builder(
                  controller: homeCtrl.pageCont,
                  itemCount: 3,
                  onPageChanged: (val) {
                    homeCtrl.selectedTab.value = val;
                    _onCategoryTap(homeCtrl.selectedTab.value);
                  },
                  itemBuilder: (_, i) => tabScreens[i],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onCategoryTap(int index) {
    homeCtrl.selectedTab.value = index;
    homeCtrl.pageCont.jumpToPage(index);
  }
}

class TaxTab extends StatelessWidget {
  TaxTab({
    super.key,
  });
  final homeCtrl = Get.find<HomeCtrl>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          CustomProgressBar(),
          homeCtrl.currentSection.value == 0
              ? PersonalInformation()
              : homeCtrl.currentSection.value == 1
                  ? Income()
                  : homeCtrl.currentSection.value == 2
                      ? const Expences()
                      : homeCtrl.currentSection.value == 3
                          ? Deductions()
                          : homeCtrl.currentSection.value == 4
                              ? Review()
                              : const SizedBox(),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  title: "Back",
                  isBorder: true,
                  onTap: () {
                    if (homeCtrl.currentSection.value != 0) {
                      homeCtrl.currentSection.value =
                          homeCtrl.currentSection.value - 1;
                    }
                  },
                ),
                CustomButton(
                  title: homeCtrl.currentSection.value == 4 ? "Submit" : "Next",
                  onTap: () {
                    if (homeCtrl.currentSection.value < 4) {
                      if (homeCtrl.nameCtrl.text.isNotEmpty &&
                          homeCtrl.insuranceCtrl.text.isNotEmpty &&
                          homeCtrl.dobCtrl.text.isNotEmpty &&
                          homeCtrl.addressCtrl.text.isNotEmpty &&
                          homeCtrl.utrCtrl.text.isNotEmpty &&
                          homeCtrl.taxYearCtrl.text.isNotEmpty) {
                        homeCtrl.currentSection.value =
                            homeCtrl.currentSection.value + 1;
                      } else {
                        Get.snackbar("Error!", "Please fill all  the detail.",
                            backgroundColor: Colors.red,
                            colorText: Colors.white);
                      }
                    } else if (homeCtrl.currentSection.value == 4) {
                      Get.to(() => const SuccessPage(),
                          transition: Transition.rightToLeft);
                    }
                  },
                )
              ],
            ),
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 6)
        ],
      ),
    );
  }
}
