import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final navigationStateHolder = context.watch<NavigationState>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              strings.app_title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            ElevatedButton(
              onPressed: () => navigationStateHolder.gotoCategories(),
              child: Text(
                strings.start_button,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
