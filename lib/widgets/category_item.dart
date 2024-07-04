import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../models/category.dart';
import '../theme/theme.dart';

class CategoryItem extends StatelessWidget {
  final ProductCategory category;

  const CategoryItem({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    final navigationStateHolder = context.watch<NavigationState>();

    return ListTile(
      onTap: () => navigationStateHolder.gotoProducts(category.id),
      leading: SizedBox(
        height:
            Theme.of(context).extension<YaShoppingTheme>()?.categoryIconHeight,
        child: Image.asset(
          'assets/categories/${category.asset}',
          fit: BoxFit.fitHeight,
        ),
      ),
      title: Text(
        category.title[Localizations.localeOf(context).languageCode] ?? '?',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
