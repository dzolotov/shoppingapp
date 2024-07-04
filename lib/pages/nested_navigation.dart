import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/nested_navigation_controller.dart';
import '../main.dart';
import 'categories.dart';
import 'products.dart';
import 'single_product.dart';

class NestedNavigationShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nestedController = context.read<NestedShopNavigationController>();
    final navigationStateHolder = context.watch<NavigationState>();

    return SafeArea(
      child: Navigator(
        onPopPage: (route, result) => route.didPop(result),
        key: nestedController.key,
        pages: [
          MaterialPage(child: CategoriesPage()),
          if (navigationStateHolder.category != null)
            MaterialPage(
                child: ProductsPage(category: navigationStateHolder.category!)),
          if (navigationStateHolder.category != null &&
              navigationStateHolder.product != null)
            MaterialPage(
                child: SingleProductPage(id: navigationStateHolder.product!)),
        ],
      ),
    );
  }
}
