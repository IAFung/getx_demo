import 'package:flutter/material.dart';
import 'package:food_square/app/home/data/category.dart';
import 'package:food_square/app/meal/controllers/meal_controller.dart';
import 'package:food_square/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'meal_item.dart';

class MealPage extends StatelessWidget {
  final MealController controller = Get.find();
  final CategoryElement categoryElement = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return GetX<MealController>(
      initState: (_) async {
        await controller.getList(categoryElement.id);
      },
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(categoryElement.title),
          ),
          body: controller.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : controller.list.length <= 0
                  ? Center(
                      child: Text(
                      "无结果",
                      style: Theme.of(context).textTheme.headline1,
                    ))
                  : ListView.builder(
                      itemCount: controller.list.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: MealItemWidget(controller.list[index]),
                          onTap: () => Get.toNamed(Routes.DETAILS,
                              arguments: controller.list[index]),
                        );
                      }),
        );
      },
    );
  }
}
