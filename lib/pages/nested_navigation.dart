import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/nested_navigation_controller.dart';
import 'categories.dart';
import 'products.dart';
import 'single_product.dart';

class NestedNavigationShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nestedController = context.read<NestedShopNavigationController>();
    return SafeArea(
      child: Navigator(
        key: nestedController.key,
        initialRoute: '/',
        onGenerateRoute: (route) {
          final splitted = (route.name ?? '/').split('/');
          if (splitted[1].isEmpty) {
            return MaterialPageRoute(
              builder: (context) => CategoriesPage(),
            );
          }
          final page = splitted[1];
          switch (page) {
            case 'products':
              return MaterialPageRoute(
                builder: (context) => ProductsPage(
                  category: int.parse(
                    splitted[2],
                  ),
                ),
              );
            case 'product':
              return MaterialPageRoute(
                builder: (context) => SingleProductPage(
                  id: int.parse(
                    splitted[2],
                  ),
                ),
              );
          }
          return MaterialPageRoute(
            builder: (context) => ErrorWidget(
              Exception('Not found'),
            ),
          );
        },
      ),
    );
  }
}
