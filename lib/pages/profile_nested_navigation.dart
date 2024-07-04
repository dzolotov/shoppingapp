import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yashopping/pages/profile_details.dart';
import 'package:yashopping/pages/profile_page.dart';

import '../controllers/nested_navigation_controller.dart';
import '../main.dart';

class NestedNavigationProfilePage extends StatelessWidget {
  NestedNavigationProfilePage();

  @override
  Widget build(BuildContext context) {
    final nestedController = context.read<NestedProfileNavigationController>();
    final navigationStateHolder = context.watch<NavigationState>();

    return SafeArea(
      child: Navigator(
        key: nestedController.key,
        onPopPage: (route, result) => route.didPop(result),
        pages: [
          MaterialPage(child: ProfilePage()),
          if (navigationStateHolder.profileDetails)
            MaterialPage(child: ProfileDetailsPage()),
        ],
      ),
    );
  }
}
