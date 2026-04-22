import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/core/widgets/drawer_list_tile.dart';
import 'package:shoppingapp/features/Home/provider/home_provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
  final provider=  context.read<HomeProvider>();
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Icon(Icons.shop)),
          DrawerListTile(
            title: "DashBoard",
            svgSrc: "",
            onTap: () {
              provider.navigateToScreen("Dashboard");
            },
          ),DrawerListTile(
            title: "Category",
            svgSrc: "",
            onTap: () {
              provider.navigateToScreen("Category");
            },
          ),DrawerListTile(
            title: "Order",
            svgSrc: "",
            onTap: () {
              provider.navigateToScreen("Order");
            },
          ),
        ],
      ),
    );
  }
}
