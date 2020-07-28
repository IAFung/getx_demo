import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_square/app/common/utils/network/http_request.dart';
import 'package:food_square/app/theme/app_theme.dart';
import 'package:food_square/app/translations/app_translation.dart';
import 'app/routes/app_pages.dart';
import 'package:get/route_manager.dart';

void main() {
  HttpBinRequest().request().then((value) {
    print(value);
  });
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

class HttpBinRequest extends BaseRequest {
  @override
  String get baseUrl => "https://httpbin.org";
  @override
  String get path => "/post";
  @override
  Map<String, dynamic> get params => {"1": "2", "5": 6};
  @override
  RequestType get type => RequestType.POST;
  @override
  RequestSerializer get requestSerializer => RequestSerializer.HTTP;
  @override
  Map<String, String> get headers => {"Token": "123"};
}
