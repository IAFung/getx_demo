import 'package:flutter/material.dart';
import 'package:food_square/app/favor/controllers/favor_controller.dart';
import 'package:food_square/app/meal/pages/meal_item.dart';
import 'package:food_square/app/routes/app_pages.dart';
import 'package:get/get.dart';

class FavorPage extends StatelessWidget {
  final FavorController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("favor".tr)),
        body: Obx(
          () => controller.list.length > 0
              ? ListView.builder(
                  itemCount: controller.list.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: MealItemWidget(controller.list[index]),
                      onTap: () => Get.toNamed(Routes.DETAILS,
                          arguments: controller.list[index]),
                    );
                  })
              : Center(
                  child: Text(
                    "nothing".tr,
                    style: Get.textTheme.headline1,
                  ),
                ),
        ));
  }
}
