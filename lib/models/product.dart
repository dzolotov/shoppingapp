class ProductInfo {
  final int id;
  final int category;
  final String image;
  final Map<String, String> title;
  final Map<String, String> description;
  final double price;

  const ProductInfo({
    required this.id,
    required this.category,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
  });
}
