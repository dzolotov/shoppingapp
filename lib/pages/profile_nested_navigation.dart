import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yashopping/pages/profile_details.dart';
import 'package:yashopping/pages/profile_page.dart';

import '../controllers/nested_navigation_controller.dart';
import 'categories.dart';

class NestedNavigationProfilePage extends StatelessWidget {
  NestedNavigationProfilePage();

  @override
  Widget build(BuildContext context) {
    final nestedController = context.read<NestedProfileNavigationController>();
    return SafeArea(
      child: Navigator(
        key: nestedController.key,
        initialRoute: '/profile',
        onGenerateRoute: (route) {
          final splitted = (route.name ?? '/').split('/');
          if (splitted[1].isEmpty) {
            return MaterialPageRoute(
              builder: (context) => CategoriesPage(),
            );
          }
          final page = splitted[1];
          switch (page) {
            case 'profile':
              return MaterialPageRoute(
                builder: (context) => ProfilePage(),
              );
            case 'details':
              return MaterialPageRoute(
                builder: (context) => ProfileDetailsPage(),
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
