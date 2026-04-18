import 'package:flutter/material.dart';

import '../constant/app_constant.dart';
import '../theme/app_theme.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isSecondary;
  final bool isLoading;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Widget? leadingIcon;
  final Widget? trailingIcon;

  const ButtonWidget({
    super.key,
    required this.text,
    this.onTap,
    this.isSecondary = false,
    this.isLoading = false,
    this.width,
    this.height = 56,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.leadingIcon,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: isSecondary ? _buildSecondaryButton() : _buildPrimaryButton(),
    );
  }

  Widget _buildPrimaryButton() {
    return ElevatedButton(
      onPressed: isLoading ? null : onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppTheme.primaryBlue,
        foregroundColor: textColor ?? AppTheme.whiteClr,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
        ),
        padding: padding ?? EdgeInsets.zero,
      ),
      child: _buildButtonContent(),
    );
  }

  Widget _buildSecondaryButton() {
    return OutlinedButton(
      onPressed: isLoading ? null : onTap,
      style: OutlinedButton.styleFrom(
        foregroundColor: textColor ?? AppTheme.blueColor,
        backgroundColor: backgroundColor ?? AppTheme.whiteBackground,
        side: BorderSide(
          color: borderColor ?? AppTheme.blueColor,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
        ),
        padding: padding ?? EdgeInsets.zero,
      ),
      child: _buildButtonContent(),
    );
  }

  Widget _buildButtonContent() {
    if (isLoading) {
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            isSecondary ? (textColor ?? AppTheme.blueColor) : (textColor ?? AppTheme.whiteClr),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leadingIcon != null) ...[
          leadingIcon!,
          const SizedBox(width: 8),
        ],
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: isSecondary ? (textColor ?? AppTheme.blueColor) : (textColor ?? AppTheme.whiteClr),
          ),
        ),
        if (trailingIcon != null) ...[
          const SizedBox(width: 8),
          trailingIcon!,
        ],
      ],
    );
  }
}

// Convenience constructors for common button types
class PrimaryButton extends ButtonWidget {
  const PrimaryButton({
    super.key,
    required super.text,
    super.onTap,
    super.isLoading = false,
    super.width,
    super.height = 56,
    super.fontSize = 18,
    super.fontWeight = FontWeight.w600,
    super.backgroundColor,
    super.textColor,
    super.borderRadius,
    super.padding,
    super.leadingIcon,
    super.trailingIcon,
  }) : super(isSecondary: false);
}

class SecondaryButton extends ButtonWidget {
  const SecondaryButton({
    super.key,
    required super.text,
    super.onTap,
    super.isLoading = false,
    super.width,
    super.height = 56,
    super.fontSize = 18,
    super.fontWeight = FontWeight.w600,
    super.backgroundColor,
    super.textColor,
    super.borderColor,
    super.borderRadius,
    super.padding,
    super.leadingIcon,
    super.trailingIcon,
  }) : super(isSecondary: true);
}