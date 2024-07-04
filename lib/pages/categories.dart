import 'package:flutter/material.dart';

import '../mocks/categories.dart';
import '../models/category.dart';
import '../theme/theme.dart';
import '../widgets/category_item.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<ProductCategory> categories = [];

  @override
  void initState() {
    super.initState();
    categories = predefinedCategories;
  }

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemExtent: Theme.of(context)
            .extension<YaShoppingTheme>()
            ?.categoryExtendHeight,
        itemCount: categories.length,
        itemBuilder: (_, index) => CategoryItem(
          category: categories[index],
        ),
      );
}
