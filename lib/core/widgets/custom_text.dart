import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
class CustomText extends StatelessWidget {
  final String? title;
  final TextStyle? style;
  final TextAlign? txtAlign;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final Color? color;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final int? fontFamilyLevel;
  final TextOverflow? overflow;
  final int? maxLine;
  final TextDecoration? decoration;
  final bool? autoSize;

  final int? maxLines;
  final bool? isRequired;
  final bool? overFlow;
  final bool? isPlay;

  const CustomText({
    super.key,
    this.title,
    this.style,
    this.txtAlign,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.color,
    this.fontStyle,
    this.letterSpacing,
    this.fontFamilyLevel,
    this.overflow,
    this.maxLine,
    this.decoration,
    this.autoSize,
    this.maxLines,
    this.isRequired,
    this.overFlow,
    this.isPlay = false,
  });

  @override
  Widget build(BuildContext context) {
    return (autoSize ?? false)
        ? AutoSizeText(
      title ?? '',
      textAlign: txtAlign ?? TextAlign.start,
      style: TextStyle(
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontFamily: fontFamily ?? (isPlay == false ? 'arial' : 'play'),
          letterSpacing: letterSpacing,
          decoration: decoration,
          overflow: overFlow == true ? TextOverflow.ellipsis : null),
      overflow: overflow,
      maxLines: maxLine ?? 1,
    )
        : Text(
      title ?? '',
      textAlign: txtAlign ?? TextAlign.start,
      style: TextStyle(
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: color,
          fontStyle: fontStyle ?? FontStyle.normal,
          letterSpacing: letterSpacing,
          decoration: decoration,
          fontFamily: fontFamily ?? (isPlay == false ? 'arial' : 'play'),
          overflow: overFlow == true ? TextOverflow.ellipsis : null),
      overflow: overflow,
      maxLines: maxLine ?? 1,
    );
  }
}