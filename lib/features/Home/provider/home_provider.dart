import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/features/category/view/category_view.dart';
import 'package:shoppingapp/features/dashboard/view/dashboard_view.dart';
import 'package:shoppingapp/features/order/view/order_view.dart';

class HomeProvider extends ChangeNotifier {
  Widget selectCategory = DashboardView();

  void navigateToScreen(String selectName) {
    switch (selectName) {
      case "Dashboard":
        selectCategory=DashboardView();
        break;
      case "Category":
        selectCategory=CategoryView();
        break;
      case "Order":
        selectCategory=OrderView();
        break;
      default:
    }
    notifyListeners();
  }
}
