import 'package:flutter/material.dart';
import 'package:food_square/app/common/ui/button_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:food_square/app/favor/controllers/favor_controller.dart';
import 'package:food_square/app/meal/data/meal.dart';
import 'package:get/get.dart';

final radius = 10.0;

class MealItemWidget extends StatelessWidget {
  final FavorController controller = Get.find();
  final MealElement mealElement;
  MealItemWidget(this.mealElement);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Column(
        children: <Widget>[buildMealInfo(), buildOperatorInfo()],
      ),
    );
  }

  Widget buildOperatorInfo() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ButtonItem(
            icon: Icon(Icons.schedule),
            title: "${mealElement.duration}" + "minutes".tr,
          ),
          ButtonItem(
            icon: Icon(Icons.restaurant),
            title: mealElement.complexString,
          ),
          InkWell(
            onTap: () => controller.updateElement(mealElement),
            child: Obx(() => mealElement.containsElement
                ? ButtonItem(
                    icon: Icon(Icons.favorite),
                    title: "collected".tr,
                  )
                : ButtonItem(
                    icon: Icon(Icons.favorite_border),
                    title: "collect".tr,
                  )),
          )
        ],
      ),
    );
  }

  Widget buildMealInfo() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius),
              topRight: Radius.circular(radius)),
          child: CachedNetworkImage(
            imageUrl: mealElement.imageUrl,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 20,
          bottom: 20,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(8)),
            width: 300,
            child: Text(mealElement.title,
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                )),
          ),
        )
      ],
    );
  }
}
