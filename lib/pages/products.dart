import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yashopping/mocks/categories.dart';
import 'package:yashopping/models/category.dart';

import '../mocks/products.dart';
import '../models/product.dart';
import '../theme/theme.dart';
import '../widgets/product_item.dart';

class ProductsPage extends StatefulWidget {
  final int category;

  const ProductsPage({
    required this.category,
    super.key,
  });

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<ProductInfo> products = [];
  late ProductCategory category;

  @override
  void initState() {
    super.initState();
    category = predefinedCategories.firstWhere((e) => e.id == widget.category);
    products =
        predefinedProducts.where((e) => e.category == widget.category).toList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
              category.title[Localizations.localeOf(context).languageCode]!),
        ),
        body: products.isEmpty
            ? Center(
                child: Text(AppLocalizations.of(context)!.no_products),
              )
            : Padding(
                padding: EdgeInsets.only(
                    top: Theme.of(context)
                        .extension<YaShoppingTheme>()!
                        .productsListTopPadding),
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) =>
                      ProductItem(productInfo: products[index]),
                  itemExtent: Theme.of(context)
                      .extension<YaShoppingTheme>()!
                      .productsListItemExtent,
                ),
              ),
      );
}
