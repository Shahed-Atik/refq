import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:refq_mongo/shared/services/storage_service.dart';

import 'app/app.dart';
import 'localizations/codegen_loader.g.dart';

void main() async {
  await initLibraries();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  runApp(EasyLocalization(
      child: AppWidget(savedThemeMode),
      supportedLocales: const [Locale('en')],
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      path: "translations/"));
}

Future initLibraries() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await StorageService().initInstance();
}
