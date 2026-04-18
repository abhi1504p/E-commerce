import 'package:flutter/material.dart';



class AppTheme {
  static const String _fontFamilySora = 'Sora';
  static const String fontFamilyPalanquin = 'Palanquin';
  static const String fontFamilyAntonio = 'Antonio';

  static const backgroundColor = Color(0xFFFCF6ED);
  static const vector1 = Color(0xFF0044B5);
  static const vector2 = Color(0xFFF57814);
  static const vector3 = Color(0xFFF57814);
  static const lightVector3 = Color(0xFFFAF4EB);
  static const blueColor = Color(0xFF005191);
  static const whiteBackground = Color(0xFFFFFFFF);
  static const textColor = Color(0xFF232121);
  static const hintColor = Color(0x89232121);
  static const textFormFieldOutlineClr = Color(0xffD9D9D9);
  static const stepperTextColor = Color(0xff6E7073);
  static const unselectedGrey = Color(0xffB5B5B5);
  static const whiteClr = Color(0xffffffff);

  static const primaryBlue = Color(0xff005191);
  static const primaryRed = Color(0xffDD1367);
  static const hoverBlue = Color(0xff052898);
  static const secondaryGrey = Color(0xffa6a6ad);
  static const thirdGrey = Color(0xff6e7073);
  static const borderGrey = Color(0xffD9D9D9);

  static const placeholderBackground = Color(0xffEFEFEF);

  static const syncedGreen = Color(0xff4C9F38);
  static const selectedBody = Color(0x8695ec99);
  static const selectedBorder = Color(0xff95ec99);
  static const errorRed = Color(0xffef2121);
  static const transparentColor = Color(0x00000000);
  static const whiteColor = Color(0xffFFFFFF);
  static const blackColor = Color(0xff000000);

  static const expansionTileBg = Color(0xffF7F7F7);
  static const draftClr = Color(0xffE9AE38);
  static const submitClr = Color(0xff1FAF75);

  static const yellowColor = Color(0xffE9AE38);
  static const warningRedColor = Color(0xffD00026);
  static const unSelectColor = Color(0xff5E5E5E);

  static const chapterExpandedClr = Color(0xffE2F0FF);
  static const greenClr = Color(0xff04960E);

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: whiteBackground,
      primaryColor: blueColor,
      colorScheme: ColorScheme.light(
        primary: blueColor,
        secondary: primaryRed,
        surface: whiteClr,
        onPrimary: whiteClr,
        onSecondary: whiteClr,
        onSurface: textColor,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: primaryBlue,
        selectionColor: primaryBlue.withAlpha(50),
        selectionHandleColor: primaryBlue,
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          fontFamily: fontFamilyPalanquin,
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          color: textColor,
        ),
        bodyLarge: TextStyle(
          fontFamily: fontFamilyPalanquin,
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
          color: textColor,
        ),
        bodySmall: TextStyle(
          fontFamily: fontFamilyPalanquin,
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
          color: textColor,
        ),
        headlineMedium: TextStyle(
          fontFamily: fontFamilyPalanquin,
          fontWeight: FontWeight.w500,
          fontSize: 20.0,
          color: textColor,
        ),
        headlineLarge: TextStyle(
          fontFamily: fontFamilyPalanquin,
          fontWeight: FontWeight.w700,
          fontSize: 24.0,
          color: textColor,
        ),
        headlineSmall: TextStyle(
          fontFamily: fontFamilyPalanquin,
          fontWeight: FontWeight.w400,
          fontSize: 18.0,
          color: textColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: textFormFieldOutlineClr, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: textFormFieldOutlineClr, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(color: primaryBlue, width: 1),
        ),
        hintStyle: TextStyle(
          fontFamily: fontFamilyPalanquin,
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          color: hintColor,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(secondaryGrey),
        checkColor: WidgetStateProperty.all(primaryBlue),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: whiteClr,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
        constraints: BoxConstraints(minHeight: 500),
        showDragHandle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          textStyle: TextStyle(
            fontFamily: fontFamilyPalanquin,
            fontWeight: FontWeight.w700,
            color: whiteClr,
            fontSize: 16.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
      bottomAppBarTheme: BottomAppBarThemeData(
        color: whiteClr,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        enableFeedback: false,
        type: BottomNavigationBarType.fixed,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(primaryBlue),
        trackColor: WidgetStateProperty.all(unselectedGrey),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: whiteClr,
        insetPadding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      appBarTheme: AppBarTheme(
        color: whiteClr,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      expansionTileTheme: ExpansionTileThemeData(
        iconColor: primaryBlue,
        textColor: textColor,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: blackColor,
      primaryColor: primaryBlue,
      colorScheme: ColorScheme.dark(
        primary: primaryBlue,
        secondary: primaryRed,
        surface: blackColor,
        onPrimary: whiteClr,
        onSecondary: whiteClr,
        onSurface: stepperTextColor,
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          fontFamily: fontFamilyPalanquin,
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          color: whiteClr,
        ),
        bodyLarge: TextStyle(
          fontFamily: fontFamilyPalanquin,
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
          color: whiteClr,
        ),
        bodySmall: TextStyle(
          fontFamily: fontFamilyPalanquin,
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
          color: whiteClr,
        ),
        headlineMedium: TextStyle(
          fontFamily: fontFamilyPalanquin,
          fontWeight: FontWeight.w500,
          fontSize: 20.0,
          color: whiteClr,
        ),
        headlineLarge: TextStyle(
          fontFamily: fontFamilyPalanquin,
          fontWeight: FontWeight.w600,
          fontSize: 24.0,
          color: whiteClr,
        ),
        headlineSmall: TextStyle(
          fontFamily: fontFamilyPalanquin,
          fontWeight: FontWeight.w400,
          fontSize: 18.0,
          color: whiteClr,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: textFormFieldOutlineClr),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textFormFieldOutlineClr),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryBlue, width: 2.0),
        ),
        hintStyle: TextStyle(
          fontFamily: fontFamilyPalanquin,
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          color: hintColor,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: blackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
        constraints: BoxConstraints(minHeight: 500),
        showDragHandle: true,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: blackColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          textStyle: TextStyle(
            fontFamily: fontFamilyPalanquin,
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }
}

extension Themes on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

}