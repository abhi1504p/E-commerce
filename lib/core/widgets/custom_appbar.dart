import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  late Color? backgroundColor;
  final IconThemeData leadingIconTheme;
  final TextStyle textStyle;
  final bool showLeadingIcon;

  CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.textStyle = const TextStyle(fontWeight: FontWeight.w400, fontSize: 23, color: Colors.white),
    this.backgroundColor,
    this.leadingIconTheme = const IconThemeData(color: Colors.white),
    this.showLeadingIcon = true,
  });

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: showLeadingIcon,
      centerTitle: false,
      title: Text(title, style: textStyle),
      titleSpacing: showLeadingIcon ? 0 : 15,
      iconTheme: leadingIconTheme,
      backgroundColor: backgroundColor ?? context.theme.primaryColor,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}