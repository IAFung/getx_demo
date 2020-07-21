import 'package:flutter/material.dart';
import 'package:food_square/app/home/data/category.dart';
import 'package:food_square/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("home".tr),
          leading: IconButton(
              icon: Icon(Icons.build),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              })),
      body: Obx(() => controller.list.length > 0
          ? GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.5),
              itemBuilder: (context, index) {
                return CategoryItemWidget(controller.list[index]);
              },
              itemCount: controller.list.length,
            )
          : Center(child: CircularProgressIndicator())),
    );
  }
}

class CategoryItemWidget extends StatelessWidget {
  final CategoryElement categoryElement;
  CategoryItemWidget(this.categoryElement);

  @override
  Widget build(BuildContext context) {
    final color = categoryElement.realColor;

    return InkWell(
      onTap: () => Get.toNamed(Routes.MEAL, arguments: categoryElement),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          categoryElement.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color,
            gradient: LinearGradient(colors: [color.withOpacity(0.7), color])),
      ),
    );
  }
}
