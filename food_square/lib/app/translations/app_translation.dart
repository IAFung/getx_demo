import 'package:flutter/material.dart';

import 'en_US/en_us_translations.dart';
import 'zh_CN/zh_cn_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en_US': enUS,
    'zh_CN': zhCN
  };

  static List<Locale> locales = [Locale('zh', 'CN'), Locale('en', 'US')];
}
