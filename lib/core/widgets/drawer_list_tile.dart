import 'package:flutter/material.dart';
import 'package:shoppingapp/core/widgets/custom_text.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final String svgSrc;
  final GestureTapCallback onTap;

  const DrawerListTile({
    super.key,
    required this.title,
    required this.svgSrc,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Image.asset(svgSrc),
            CustomText(title: title),
          ],
        ),
      ),
    );
  }
}
