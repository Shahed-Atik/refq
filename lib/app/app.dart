import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refq_mongo/shared/theme/app_theme.dart';

import 'intro/intro_page.dart';

class AppWidget extends StatelessWidget {
  AppWidget(AdaptiveThemeMode? adaptiveThemeMode, {Key? key})
      : savedAdaptiveThemeMode = adaptiveThemeMode ?? AdaptiveThemeMode.system,
        super(key: key);

  final AdaptiveThemeMode savedAdaptiveThemeMode;
  final TransitionBuilder botToastBuilder = BotToastInit();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: () => AdaptiveTheme(
            light: AppTheme.instance.lightTheme(context: context),
            dark: AppTheme.instance.darkTheme(context: context),
            initial: savedAdaptiveThemeMode,
            builder: (lightTheme, darkTheme) => MaterialApp(
                  title: 'Blue Bits App',
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  debugShowCheckedModeBanner: false,
                  locale: context.locale,
                  builder: (context, child) {
                    child = botToastBuilder(context, child);
                    return child;
                  },
                  home: const IntroPage(),
                  navigatorObservers: [BotToastNavigatorObserver()],
                  theme: lightTheme,
                  darkTheme: darkTheme,
                )));
  }
}
