import 'package:flutter/material.dart';
import 'package:food_square/app/filter/controllers/filter_controller.dart';
import 'package:food_square/app/filter/data/list_model.dart';
import 'package:get/get.dart';

class FilterPage extends StatelessWidget {
  final FilterController controller = Get.find();
  final List<ListItem> list = [
    ListItem(title: "五谷蛋白", subTitle: "展示五谷蛋白食物", isSelected: false),
    ListItem(title: "不含乳糖", subTitle: "展示不含乳糖食物", isSelected: false),
    ListItem(title: "普通素食者", subTitle: "展示普通素食相关食物", isSelected: false),
    ListItem(title: "严格素食者", subTitle: "展示严格素食食物", isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("filter".tr),
        leading: IconButton(icon: Icon(Icons.close), onPressed: Get.back),
      ),
      body: Column(
        children: <Widget>[
          buildHeader(context),
          Expanded(
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    ListItem item = list[index];
                    Widget trigger;
                    switch (index) {
                      case 0:
                        trigger = Obx(() => Switch(
                            value: controller.isGlutenFree,
                            onChanged: (bool) {
                              controller.isGlutenFree = bool;
                            }));
                        break;
                      case 1:
                        trigger = Obx(() => Switch(
                            value: controller.isLactoseFree,
                            onChanged: (bool) {
                              controller.isLactoseFree = bool;
                            }));
                        break;
                      case 2:
                        trigger = Obx(() => Switch(
                            value: controller.isVegetarian,
                            onChanged: (bool) {
                              controller.isVegetarian = bool;
                            }));
                        break;
                      case 3:
                        trigger = Obx(() => Switch(
                            value: controller.isVegan,
                            onChanged: (bool) {
                              controller.isVegan = bool;
                            }));
                        break;
                      default:
                        break;
                    }
                    return ListTile(
                      title: Text(item.title),
                      subtitle: Text(item.subTitle),
                      trailing: trigger,
                    );
                  }))
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Text(
          "展示你的选择",
          style: Theme.of(context).textTheme.headline1,
        ));
  }
}
