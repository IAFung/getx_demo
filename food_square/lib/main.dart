import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_square/app/theme/app_theme.dart';
import 'package:food_square/app/translations/app_translation.dart';
import 'app/routes/app_pages.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      getPages: AppPages.pages,
      supportedLocales: AppTranslation.locales,
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      // locale: Locale("zh", "CN"),
      translationsKeys: AppTranslation.translations,
      theme: AppTheme.normalTheme));
}
