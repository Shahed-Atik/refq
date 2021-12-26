import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refq_mongo/shared/utils/constant.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._internal();

  static final AppTheme instance = AppTheme._internal();

  ThemeData lightTheme({Color? primaryColor, required BuildContext context}) =>
      ThemeData(
          fontFamily: "SF",
          brightness: Brightness.light,
          primaryColor: primaryColor ?? AppColors.primary,
          cardColor: AppColors.lightGray,
          textTheme: textTheme(isDark: false),
          colorScheme: ColorScheme.light(
            primary: primaryColor ?? AppColors.primary,
            secondary: AppColors.secondary,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            elevation: 0,
            padding: EdgeInsets.zero,
          )),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              primary: Theme.of(context).colorScheme.primary,
              elevation: 0,
              side: BorderSide(
                  width: 1.5, color: Theme.of(context).colorScheme.primary),
              shape: RoundedRectangleBorder(borderRadius: borderRadiusCircular),
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 18.sp),
            ),
          ),
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: primaryColor ?? AppColors.primary,
              selectionHandleColor: primaryColor ?? AppColors.primary),
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor ?? AppColors.primary),
              borderRadius: borderRadiusCircular,
            ),
            errorStyle: const TextStyle(height: 0, color: Colors.transparent),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            border: InputBorder.none,
          ));

  ThemeData darkTheme({Color? primaryColor, required BuildContext context}) =>
      ThemeData(
        primaryColor: primaryColor ?? AppColors.primary,
        textTheme: textTheme(isDark: true),
        brightness: Brightness.dark,
        fontFamily: "SF",
        colorScheme: ColorScheme.dark(
            primary: primaryColor ?? AppColors.primary,
            secondary: AppColors.secondary),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
          padding: EdgeInsets.zero,
        )),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: Theme.of(context).colorScheme.primary,
            elevation: 0,
            side: BorderSide(
                width: 1.5, color: Theme.of(context).colorScheme.primary),
            shape: RoundedRectangleBorder(borderRadius: borderRadiusCircular),
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 18.sp),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
            cursorColor: primaryColor ?? AppColors.primary,
            selectionHandleColor: primaryColor ?? AppColors.primary),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor ?? AppColors.primary),
            borderRadius: borderRadiusCircular,
          ),
          errorStyle: const TextStyle(height: 0, color: Colors.transparent),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          border: InputBorder.none,
        ),
      );

  TextTheme textTheme({bool isDark = false}) => TextTheme(
      headline1: headlineStyle(isDark: isDark),
      headline2: headlineStyle(isDark: isDark),
      headline3: headlineStyle(isDark: isDark),
      headline4: headlineStyle(isDark: isDark),
      headline5: headlineStyle(
          isDark: isDark, fontSize: 24.sp, fontWeight: FontWeight.bold),
      headline6: headlineStyle(isDark: isDark, fontSize: 20.sp),
      bodyText1: bodyTextStyle(isDark: isDark, fontSize: 17.sp),
      bodyText2: bodyTextStyle(isDark: isDark, fontSize: 15.sp),
      subtitle1: subtitleStyle(isDark: isDark),
      subtitle2: subtitleStyle(isDark: isDark),
      caption: captionTextStyle(isDark: isDark),
      overline: headlineStyle(isDark: isDark),
      button: bodyTextStyle(isDark: isDark, fontSize: 15.sp));

  TextStyle headlineStyle(
          {bool isDark = false, double? fontSize, FontWeight? fontWeight}) =>
      TextStyle(
        fontSize: fontSize,
        color: isDark ? Colors.white : Colors.black,
        fontWeight: fontWeight,
      );

  TextStyle bodyTextStyle({bool isDark = false, required double fontSize}) =>
      TextStyle(
          fontSize: fontSize, color: isDark ? Colors.white : Colors.black);

  TextStyle captionTextStyle({bool isDark = false}) =>
      TextStyle(fontSize: 12.sp, color: isDark ? Colors.white : Colors.black);

  TextStyle subtitleStyle({bool isDark = false}) =>
      TextStyle(fontSize: 14.sp, color: isDark ? Colors.white : Colors.black);

  void setThemeToLight(BuildContext context) =>
      AdaptiveTheme.of(context).setLight();

  void setThemeToDark(BuildContext context) =>
      AdaptiveTheme.of(context).setDark();

  void setThemeToSystem(BuildContext context) =>
      AdaptiveTheme.of(context).setSystem();
}
