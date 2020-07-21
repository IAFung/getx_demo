import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_square/app/favor/controllers/favor_controller.dart';
import 'package:food_square/app/meal/data/meal.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  final MealElement mealElement = Get.arguments;
  final FavorController controller = Get.find<FavorController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.updateElement(mealElement),
        backgroundColor: Colors.amber,
        child: Obx(() => mealElement.containsElement
            ? Icon(
                Icons.favorite,
                color: Colors.red,
              )
            : Icon(
                Icons.favorite,
              )),
      ),
      appBar: AppBar(
        title: Text(mealElement.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildImageView(mealElement),
            buildMakeTitle("制作原料"),
            buildMaterial(mealElement),
            buildMakeTitle("制作步骤"),
            buildMakeStep(mealElement)
          ],
        ),
      ),
    );
  }

  Container buildMakeTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Text(title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    );
  }
}

Widget buildImageView(MealElement element) {
  return Container(
    child: CachedNetworkImage(imageUrl: element.imageUrl),
  );
}

Widget buildMaterial(MealElement element) {
  return NestedListView(
    itemCount: element.ingredients.length,
    itemBuilder: (context, index) => Card(
        color: Colors.amber,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(element.ingredients[index],
                style: TextStyle(fontSize: 14)))),
  );
}

Widget buildMakeStep(MealElement element) {
  return NestedListView(
    itemCount: element.steps.length,
    itemBuilder: (context, index) => ListTile(
      leading: CircleAvatar(
        child: Text("#${index + 1}"),
      ),
      title: Text(element.steps[index]),
    ),
  );
}

class NestedListView extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;

  const NestedListView({Key key, this.itemBuilder, this.itemCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width - 30,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.grey)),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: itemBuilder,
          itemCount: itemCount,
        ));
  }
}
