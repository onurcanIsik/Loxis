import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loxis/core/app/app.dart';
import 'package:loxis/core/constant/app_constant.dart';
import 'package:loxis/core/helpers/app_helper.dart';
import 'package:loxis/core/utils/localization/language.manager.dart';

void main() async {
  await AppHelper.initializeFirebaseApp();
  runApp(
    EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: AppConstants.LANG_ASSET_PATH,
      saveLocale: true,
      useOnlyLangCode: true,
      fallbackLocale: LanguageManager.instance.supportedLocales.first,
      child: ProviderScope(child: App()),
    ),
  );
}
