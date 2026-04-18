import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_theme.dart';


class CustomTextFormField extends StatelessWidget {
  final String? title;
  final String? prefixIcon;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obsecure;
  final VoidCallback? onPressed;
  final bool suffixIconEnable;
  final bool hideTitle;
  final String? Function(String?)? validator;
  final InputDecoration? decoration;
  final int? maxLength;
  final FocusNode? focusNode;
  final TextInputFormatter? inputFormatter;
  final int? maxLines;
  final bool readOnly;
  final Function(String)? onChanged;
  const CustomTextFormField({
    super.key,
    this.title,
    this.prefixIcon,
    required this.hintText,
    required this.controller,
    this.obsecure = false,
    this.keyboardType = TextInputType.text,
    this.onPressed,
    this.suffixIconEnable = false,
    this.validator,
    this.hideTitle = false,
    this.decoration,
    this.maxLength,
    this.focusNode,
    this.inputFormatter,
    this.maxLines,
    this.readOnly = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!hideTitle) ...[
          Row(
            children: [
              if (prefixIcon != null) ...[Image.asset(prefixIcon!, width: 20, height: 20), const SizedBox(width: 8)],
              Text(title ?? '', style: const TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          controller: controller,
          readOnly: readOnly,
          obscureText: obsecure,
          keyboardType: keyboardType,
          validator: validator,
          maxLength: maxLength,
          focusNode: focusNode,
          onChanged: onChanged,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: inputFormatter != null ? [inputFormatter!] : null,
          maxLines: maxLines,
          onTap: readOnly ? onPressed : null,
          decoration: decoration ??
              InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppTheme.stepperTextColor.withAlpha(50),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppTheme.stepperTextColor.withAlpha(50),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppTheme.primaryBlue,
                    width: 2,
                  ),
                ),
                filled: true,
                fillColor: AppTheme.whiteClr,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                counter: const SizedBox.shrink(),
                counterText: '',
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                errorMaxLines: 2,
                suffixIcon: suffixIconEnable && !readOnly
                    ? IconButton(onPressed: onPressed, icon: Icon(obsecure ? Icons.visibility_off : Icons.visibility, color: Colors.blue))
                    : const SizedBox.shrink(),
              ),
        ),
      ],
    );
  }
}