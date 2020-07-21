import 'package:flutter/material.dart';
import 'package:food_square/app/routes/app_pages.dart';
import 'package:food_square/app/theme/app_theme.dart';
import 'package:get/get.dart';
import '../../favor/pages/favor_page.dart';
import '../../home/pages/home_page.dart';
import '../controllers/main_controller.dart';
import 'package:get/state_manager.dart';

class MainPage extends StatelessWidget {
  final MainController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Get.locale = Localizations.localeOf(Get.context) ?? Locale('en', 'US');
    return Scaffold(
        drawer: Drawer(
            child: Column(
          children: <Widget>[
            buildTopView(context),
            SizedBox(
              height: 30,
            ),
            buildListItem(Icons.restaurant, "meal".tr, context, () {
              Get.back();
            }),
            buildListItem(Icons.filter, "filter".tr, context, () {
              Get.toNamed(Routes.FILTER);
              // Get.back();
            }),
            buildListItem(Icons.inbox, "switch_language".tr, context, () {
              if (Get.locale.languageCode == "zh") {
                Get.updateLocale(Locale("en", 'US'));
              } else {
                Get.updateLocale(Locale("zh", 'CN'));
              }
              // Get.back();
            }),
            buildListItem(Icons.switch_video, "switch_theme".tr, context, () {
              Get.changeTheme(AppTheme.pinkTheme);
              // Get.back();
            }),
          ],
        )),
        body: Obx(() => IndexedStack(
              index: controller.currentIndex,
              children: <Widget>[HomePage(), FavorPage()],
            )),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text("home".tr)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), title: Text("favor".tr)),
              ],
              currentIndex: controller.currentIndex,
              onTap: controller.onTabTapped,
              unselectedItemColor: Colors.grey,
              // selectedItemColor: Colors.blue,
              unselectedFontSize: 12,
              selectedFontSize: 12,
            )));
  }

  Widget buildListItem(IconData icon, String title, BuildContext context,
      void Function() onTap) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(
          icon,
          size: 30,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
          // style: Get.textTheme.headline1, //不管用,不知道原因
        ),
      ),
      onTap: onTap,
    );
  }

  Container buildTopView(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      alignment: Alignment(0, 0.72),
      child: Text(
        "Let's Go !!!".tr,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
