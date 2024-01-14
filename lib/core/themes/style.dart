import 'package:flutter/material.dart';
import 'package:glamori/core/themes/colors.dart';

class AppStyle {
  AppStyle._();

  static TextStyle styleTextBody10({Color? colorText, double? size = 10, FontWeight? fontWeight, TextDecoration? decoration}) => TextStyle(
        color: colorText ?? AppColors.textBlack,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );

  static TextStyle styleTextBody11({Color? colorText, double? size = 11, FontWeight? fontWeight, TextDecoration? decoration}) => TextStyle(
        color: colorText ?? AppColors.textBlack,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );
  static TextStyle styleTextBody12({Color? colorText, double? size = 12, FontWeight? fontWeight, TextDecoration? decoration}) => TextStyle(
        color: colorText ?? AppColors.textBlack,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );

  static TextStyle styleTextBody14({Color? colorText, double? size = 14, FontWeight? fontWeight, TextDecoration? decoration}) => TextStyle(
        color: colorText ?? AppColors.textBlack,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );

  static TextStyle styleTextBody15({Color? colorText, double? size = 15, FontWeight? fontWeight, TextDecoration? decoration}) => TextStyle(
        color: colorText ?? AppColors.textBlack,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );
  static TextStyle styleTextBody13({Color? colorText, double? size = 13, FontWeight? fontWeight, TextDecoration? decoration}) => TextStyle(
        color: colorText ?? AppColors.textBlack,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );

  static TextStyle styleTextBody16({Color? colorText, double? size = 16, FontWeight? fontWeight, TextDecoration? decoration}) => TextStyle(
        color: colorText ?? AppColors.textBlack,
        fontWeight: fontWeight,
        fontFamily: 'Poppins',
        fontSize: size,
        decoration: decoration,
      );

  static TextStyle styleTextBody18({Color? colorText, double? size = 18, FontWeight? fontWeight, TextDecoration? decoration}) => TextStyle(
        color: colorText ?? AppColors.textBlack,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );
  static TextStyle styleTextBody20({Color? colorText, double? size = 20, FontWeight? fontWeight, TextDecoration? decoration}) => TextStyle(
        color: colorText ?? AppColors.textBlack,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );

  static TextStyle styleTextBody30({Color? colorText, double? size = 30, FontWeight? fontWeight, TextDecoration? decoration}) => TextStyle(
        color: colorText ?? AppColors.textBlack,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );

  static TextStyle styleTextBody32({Color? colorText, double? size = 32, FontWeight? fontWeight, TextDecoration? decoration}) => TextStyle(
        color: colorText ?? AppColors.textBlack,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );
  static TextStyle styleTextBody22({Color? colorText, double? size = 22, FontWeight? fontWeight, TextDecoration? decoration}) => TextStyle(
        color: colorText ?? AppColors.textBlack,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );

  static InputDecoration inputDecorationFloating(String hint, {Widget? suffixIcon, bool? disableLabel}) => InputDecoration(
        hintText: hint,
        suffixIcon: suffixIcon,
        floatingLabelStyle: AppStyle.styleTextBody18(colorText: AppColors.primary, fontWeight: FontWeight.bold),
        hintStyle: AppStyle.styleTextBody14(colorText: AppColors.textLightGrey),
        contentPadding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            color: AppColors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            color: AppColors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        fillColor: AppColors.inputColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            color: AppColors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      );

  static InputDecoration inputDecorationFloatingTreatment(String hint, {Widget? suffixIcon, bool? disableLabel}) => InputDecoration(
        hintText: hint,
        suffixIcon: suffixIcon,
        floatingLabelStyle: AppStyle.styleTextBody18(colorText: AppColors.primary, fontWeight: FontWeight.bold),
        hintStyle: AppStyle.styleTextBody14(colorText: AppColors.textBlack),
        contentPadding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            color: AppColors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            color: AppColors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        fillColor: AppColors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            color: AppColors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      );

  static ButtonStyle styleButton({
    Color? backgroundColor,
    Color? textColor,
    double? borderRadius,
    double? fontSize,
    FontWeight? fontWeight,
    double? width,
    double? height,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? AppColors.primary,
      // onPrimary: textColor ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
      ),
      textStyle: TextStyle(
        fontSize: fontSize ?? 16.0,
        fontWeight: fontWeight,
      ),
      fixedSize: width != null ? Size(width, height ?? 50.0) : null,
    );
  }
}
