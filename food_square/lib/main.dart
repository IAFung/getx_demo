import 'package:flutter/material.dart';
import 'package:food_square/app/theme/app_theme.dart';
import 'package:food_square/app/translations/app_translation.dart';
import 'app/routes/app_pages.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      getPages: AppPages.pages,
      locale: Locale("zh", "CN"),
      translationsKeys: AppTranslation.translations,
      theme: AppTheme.normalTheme));
}
