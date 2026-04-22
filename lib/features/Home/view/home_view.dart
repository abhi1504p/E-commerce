import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/core/constant/app_logger.dart';
import 'package:shoppingapp/features/Home/components/side_menu.dart';
import 'package:shoppingapp/features/Home/provider/home_provider.dart';

import '../../../core/widgets/custom_appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(child: SideMenu()),
            Consumer<HomeProvider>(
              builder: (context, provider, child) {
                return Flexible(flex: 4, child: provider.selectCategory);
              },
            ),
          ],
        ),
      ),
    );
  }
}
