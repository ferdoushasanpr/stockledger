class Product {
  const Product({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.productCode,
    required this.purchasePrice,
    required this.sellingPrice,
    required this.stock,
    required this.status,
  });

  final int id;
  final int categoryId;
  final String name;
  final String productCode;
  final int purchasePrice;
  final int sellingPrice;
  final String stock;
  final String status;
}
