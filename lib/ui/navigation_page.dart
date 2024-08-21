import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/constants/app_colors.dart';
import 'package:task_manager/constants/app_strings.dart';
import 'package:task_manager/ui/routes/app_route.dart';
import 'package:task_manager/ui/views/pages/home.dart';

class NavigationPage extends StatelessWidget {
  NavigationPage({Key? key}) : super(key: key);
  RxInt activeIndex = 0.obs;
  final _pages = const [HomePage(), HomePage(), HomePage(), HomePage(),HomePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(AppStrings.back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(AppStrings.options),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(createTask);
        },
        shape: const CircleBorder(),
        backgroundColor: AppColors.blackColor,
        child: const Icon(Icons.add),
      ),
      body: Obx(() => _pages[activeIndex.value]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: activeIndex.value,
          onTap: (index) {
            activeIndex.value = index;
          },
          items: [
            bottomNavigationBarItem(AppStrings.home, ""),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Image.asset(AppStrings.send, scale: 5),
              ),
              label: "",
            ),
            const BottomNavigationBarItem(
              icon: SizedBox(),
              label: "",
            ),
            bottomNavigationBarItem(AppStrings.stickyNote, ""),
            bottomNavigationBarItem(AppStrings.profile, ""),
          ],
          showSelectedLabels: false,
        ),
      ),
    );
  }
}

BottomNavigationBarItem bottomNavigationBarItem(String iconPath, String buttonName) {
  return BottomNavigationBarItem(
    icon: Image.asset(iconPath, scale: 5),
    label: buttonName,
  );
}
