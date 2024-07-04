import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../models/product.dart';
import '../theme/theme.dart';

class ProductItem extends StatelessWidget {
  final ProductInfo productInfo;
  final VoidCallback? onDelete;

  const ProductItem({
    required this.productInfo,
    this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navigationStateHolder = context.watch<NavigationState>();

    return ListTile(
      onTap: () => navigationStateHolder.gotoProduct(
          productInfo.category, productInfo.id),
      leading: SizedBox(
        height:
            Theme.of(context).extension<YaShoppingTheme>()?.categoryIconHeight,
        child: Image.asset(
          'assets/products/${productInfo.image}',
          fit: BoxFit.fitHeight,
        ),
      ),
      title: Text(
        productInfo.title[Localizations.localeOf(context).languageCode] ?? '?',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: onDelete == null
          ? null
          : IconButton(
              onPressed: onDelete,
              icon: Icon(Icons.delete),
            ),
    );
  }
}
