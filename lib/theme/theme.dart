import 'package:flutter/material.dart';

class YaShoppingTheme extends ThemeExtension<YaShoppingTheme> {
  double categoryExtendHeight;
  double categoryIconHeight;
  double productExtendHeight;
  double productIconHeight;
  double productDescriptionPadding;
  double productsListTopPadding;
  double productsListItemExtent;
  double flagSize;

  YaShoppingTheme({
    this.categoryExtendHeight = 80,
    this.categoryIconHeight = 64,
    this.productExtendHeight = 80,
    this.productIconHeight = 64,
    this.productDescriptionPadding = 8,
    this.productsListTopPadding = 16,
    this.productsListItemExtent = 80,
    this.flagSize = 32,
  });

  @override
  ThemeExtension<YaShoppingTheme> copyWith({
    double? categoryExtendHeight,
    double? categoryIconHeight,
    double? productExtendHeight,
    double? productIconHeight,
    double? productDescriptionPadding,
    double? productsListTopPadding,
    double? productsListItemExtent,
    double? flagSize,
  }) =>
      YaShoppingTheme(
        categoryExtendHeight: categoryExtendHeight ?? this.categoryExtendHeight,
        categoryIconHeight: categoryIconHeight ?? this.categoryIconHeight,
        productExtendHeight: productExtendHeight ?? this.productExtendHeight,
        productIconHeight: productIconHeight ?? this.productIconHeight,
        productDescriptionPadding:
            productDescriptionPadding ?? this.productDescriptionPadding,
        productsListTopPadding:
            productsListTopPadding ?? this.productsListTopPadding,
        productsListItemExtent:
            productsListItemExtent ?? this.productsListItemExtent,
        flagSize: flagSize ?? this.flagSize,
      );

  @override
  ThemeExtension<YaShoppingTheme> lerp(
          covariant ThemeExtension<YaShoppingTheme>? other, double t) =>
      this; //not implemented
}
